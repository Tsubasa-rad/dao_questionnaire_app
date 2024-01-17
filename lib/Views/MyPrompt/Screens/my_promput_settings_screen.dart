// ignore_for_file: prefer_const_constructors

import 'package:dao_questionnaire_app/Widgets/text_copy_button.dart';
import 'package:dao_questionnaire_app/Widgets/text_length.dart';
import 'package:dao_questionnaire_app/database/data_storage.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPromptSettingScreen extends StatefulWidget {
  const MyPromptSettingScreen({super.key});

  @override
  State<MyPromptSettingScreen> createState() => _MyPromptSettingScreenState();
}

class _MyPromptSettingScreenState extends State<MyPromptSettingScreen> {
  String myPromptController = "";
  final TextEditingController _myPromptProfileController =
      TextEditingController();
  final MyPromptDataStorage myPromptDataStorage = MyPromptDataStorage();
  final DataStorage dataStorage = DataStorage();
  List<Map<String, dynamic>> dataList = [];
  @override
  void initState() {
    super.initState();
    loadDataList();
    loadMyPrompt();
  }

// データの取得
  Future<void> loadMyPrompt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      setState(() {
        myPromptController = prefs.getString('MyPrompt') ?? '現状何も保存されていません';
        _myPromptProfileController.text =
            prefs.getString('MyPromptProfile') ?? '';
      });
    });
  }

  Future<void> loadDataList() async {
    final List<Map<String, dynamic>> loadedData = await dataStorage.loadData();
    setState(() {
      dataList = loadedData;
    });
  }

  Future<void> myPromptSavePressed(String prompt, String myPmtProfile) async {
    await myPromptDataStorage.saveValues(prompt, myPmtProfile);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Myプロフィールデータの設定"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: size.width,
                decoration: Styles.blueFrame,
                padding: EdgeInsets.all(10),
                child: TextLength(caption: myPromptController),
              ),
            ),
            TextCopyButton(text: myPromptController),
            Text("現在保存中のプロンプトの中から選択肢して、\nタップしてください.下記の一覧から選択できます"),
            // 作成したどのプロンプトを設定するかの選択肢を表示
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    dataList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            myPromptController = dataList[index]['promptTMP'];
                          });
                        },
                        child: Container(
                          width: size.width / 1.8,
                          decoration: Styles.promptCardDecotation,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                dataList[index]['promptTMP'],
                                maxLines: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text("生成したデータを保存してください"),
            // データの入力フォーム
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                maxLines: 7,
                minLines: 7,
                maxLength: 250,
                controller: _myPromptProfileController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: baseColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: baseColor,
                      )),
                ),
              ),
            ),
            // データの保存するためのボタン
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    myPromptSavePressed(
                        myPromptController, _myPromptProfileController.text);

                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  });
                },
                child: Text("保存"))
          ],
        ),
      ),
    );
  }
}
