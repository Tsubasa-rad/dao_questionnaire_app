// ignore_for_file: prefer_const_declarations, prefer_interpolation_to_compose_strings

import 'package:dao_questionnaire_app/Views/QuestionnaireView/Screens/answer_list_view.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Screens/prompt_template_view.dart';
import 'package:dao_questionnaire_app/Widgets/GenerateText.dart';
import 'package:dao_questionnaire_app/database/data_storage.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.title,
    required this.dataList,
    required this.myAnswer,
  });
  final String title;
  final List<Map<String, dynamic>> dataList;

  final List<List> myAnswer;

  @override
  State<ResultScreen> createState() => _ResultScreenState(dataList);
}

class _ResultScreenState extends State<ResultScreen> {
  final DataStorage dataStorage = DataStorage();
  final List<Map<String, dynamic>> dataList;

  _ResultScreenState(this.dataList);

  Future<void> onSavePressed() async {
    final String promptTMP = "以下の文脈は、DAOとメンバーをマッチングするために行ったアンケート結果です。\n以下を読んだら「YES」と言ってください。\n#文脈\n" +generateText(widget.myAnswer);
    final Map<String, dynamic> newData = {
      'id': UniqueKey().toString(),
      // 'title': title,
      'time': DateTime.now().toString(),
      'promptTMP': promptTMP,
      'list': widget.myAnswer,
    };
    dataList.add(newData);
    await dataStorage.saveData(dataList);
  }

  @override
  void initState() {
    super.initState();
    onSavePressed();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('結果'), toolbarHeight: 30.0, // AppBarの高さ
          leading: GestureDetector(
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: const Icon(
              Icons.close, // 戻るボタンのアイコン
              color: black,
              size: 26.0,
            ),
          ),
          bottom: TabBar(tabs: [
            Text(
              "回答一覧",
              style: Styles.tabTextStyle,
            ),
            Text(
              "プロンプトテンプレート",
              style: Styles.tabTextStyle,
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            AnswerListView(
              widget: widget,
              size: size,
            ),
            PromptTemplateView(
              widget: widget,
              size: size,
              generateText: generateText(widget.myAnswer),
            ),
          ],
        ),
      ),
    );
  }
}
