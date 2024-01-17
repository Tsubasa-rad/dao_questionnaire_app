// ignore_for_file: unused_field, prefer_const_constructors, deprecated_member_use, avoid_unnecessary_containers

import 'package:dao_questionnaire_app/Views/MyPrompt/Screens/my_promput_settings_screen.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Widgets/template_card.dart';
import 'package:dao_questionnaire_app/Widgets/custom_sliver_app_bar.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPromptScreen extends StatefulWidget {
  final String title, imageURL;
  const MyPromptScreen({
    super.key,
    required this.title,
    required this.imageURL,
  });

  @override
  State<MyPromptScreen> createState() => _MyPromptScreenState();
}

class _MyPromptScreenState extends State<MyPromptScreen> {
  bool _isSwitched = true; // スイッチの状態
  // 値を入力するための変数
  String myPromptController = "";
  String _myPromptProfileController = "";
  // この画面に入ったら、はじめに処理される
  @override
  void initState() {
    super.initState();
    loadMyPrompt();
  }

  // 保存されている値の取得(値がない場合は、””を返す)
  Future<void> loadMyPrompt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      setState(() {
        myPromptController = prefs.getString('MyPrompt') ?? '';
        _myPromptProfileController = prefs.getString('MyPromptProfile') ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: widget.title,
            imageURL: widget.imageURL,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyPromptSettingScreen()),
                      );
                    },
                    child: Text("自分専用のプロンプトを設定"),
                  ),
                  _myPromptProfileController != "" && myPromptController != ""
                      ? Column(
                          children: [
                            MyPromptCard(
                                myPromptProfileController:
                                    _myPromptProfileController,
                                myPromptController: myPromptController),
                            ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30),
                                      ),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return qrCodeContent();
                                    },
                                  );
                                },
                                child: Text("QRコード表示")),
                          ],
                        )
                      : Container(
                          decoration: Styles.blueFrame,
                          padding: EdgeInsets.all(15),
                          child: Text("自分専用のプロンプトの設定をしてください"),
                        ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  Container qrCodeContent() {
    return Container(
      decoration: BoxDecoration(
        color: qrCodeBackColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "QRコード",
            style: Styles.TitleStyle,
          ),
          SizedBox(height: 5),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: QrImageView(
                  data: _myPromptProfileController,
                  // backgroundColor: white,
                  foregroundColor: baseColor,
                  embeddedImage: const AssetImage("assets/icons/icon.png"),
                  embeddedImageStyle: QrEmbeddedImageStyle(size: Size.zero),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyPromptCard extends StatelessWidget {
  const MyPromptCard({
    super.key,
    required String myPromptProfileController,
    required this.myPromptController,
  }) : _myPromptProfileController = myPromptProfileController;

  final String _myPromptProfileController;
  final String myPromptController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TemplateCard(
            topCard: true,
            title: "設定済みのプロフィール",
            templateText: _myPromptProfileController,
            adviceText: "",
          ),
          TemplateCard(
            title: "使用したプロンプト",
            templateText: myPromptController,
            adviceText: "",
          ),
        ],
      ),
    );
  }
}
