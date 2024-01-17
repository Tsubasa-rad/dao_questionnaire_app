// ignore_for_file: unused_field

import 'package:dao_questionnaire_app/Models/dao_question_model.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Screens/question_detail_screen.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Screens/result_screen.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Widgets/question_widget.dart';
import 'package:dao_questionnaire_app/Widgets/button_widget.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen(
      {super.key, required this.title, required this.dataList});
  final String title;
  final List<Map<String, dynamic>> dataList;

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  late PageController _controller;
  int _questionNumber = 1;
  int _saNumber = 1;
  bool _isLocked = false;
  List<List> myAnswer = [];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    double nowDAOList = _questionNumber / daoList.length * 100;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 50),
            Text("現在 ${nowDAOList.toStringAsFixed(0)}%"), //現在の進捗を％で表示
            remainingIndicator(), //残りのインディケータ
            const Divider(thickness: 1, color: Colors.grey),
            // クエスチョン部分の表示（カテゴリー、問題文、選択肢の表示）
            Expanded(
              child: PageView.builder(
                itemCount: daoList.length,
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final _scbList = daoList[index];
                  return buildQuestion(_scbList);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column remainingIndicator() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
              minHeight: 10,
              value: _questionNumber / daoList.length,
            ),
          ),
        ]);
  }

  Column buildQuestion(DAOQuestionModel dao) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dao.title,
          style: Styles.categoryTextStyle,
        ), //カテゴリー名の表示
        const SizedBox(height: 10),
        Text(
          dao.question,
          style: Styles.questionTextStyle,
        ), //問題文
        Text(
          dao.question2,
          style: Styles.textStyle,
        ), //問題文の補足
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 10,
          decoration: BoxDecoration(
            color: dao.color,
            borderRadius: BorderRadius.circular(5),
          ),
        ), //カテゴリーごとに割り振れてある色
        Expanded(
          child: QuestionsWidget(
            question: dao,
            onClickedOption: (option) {
              if (dao.isLocked) {
                return;
              } else {
                setState(() {
                  dao.isLocked = true;
                  dao.selectedOption = option;
                  myAnswer.add([
                    _questionNumber,
                    dao.selectedOption!.option,
                    dao.selectedOption!.detail,
                  ]); //選択肢たデータを保存する
                });
                _isLocked = dao.isLocked;
              }
            },
          ),
        ), //選択肢
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            ButtonWidget(
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return QuestionDetailScreen(
                        text: dao.detail, color: dao.color);
                  },
                );
              },
              text: "詳細",
              icon: const Icon(
                Icons.info_outline,
                color: white,
              ),
              color: baseColor,
            ), //詳細スクリーン
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(
              onTap: dao.isLocked
                  ? () {
                      setState(() {
                        myAnswer.removeLast();
                        dao.isLocked = false;
                        _isLocked = false;
                      });
                    }
                  : () {},
              text: "リセット",
              icon: const Icon(
                Icons.restart_alt_rounded,
                color: white,
              ),
              color: dao.isLocked ? baseColor : grey,
            ), //選択肢たデータをリセットする
            ButtonWidget(
              onTap: dao.isLocked
                  ? () {
                      if (_questionNumber == daoList.length - 1) {
                        dao.isLocked = false;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              title: widget.title,
                              myAnswer: myAnswer,
                              dataList: widget.dataList,
                            ),
                          ),
                        );
                      } else {
                        _controller.jumpToPage(
                          dao.selectedOption!.nextNumber,
                        );
                        setState(() {
                          dao.isLocked = false;
                          _saNumber =
                              dao.selectedOption!.nextNumber - _questionNumber;
                          _questionNumber += _saNumber;
                          _isLocked = false;
                        });
                      }
                    }
                  : () {},
              text: _questionNumber == daoList.length - 1 ? "終了" : "次へ",
              icon: _questionNumber == daoList.length - 1
                  ? const Icon(
                      Icons.check_circle_outline,
                      color: white,
                    )
                  : const Icon(
                      Icons.navigate_next_outlined,
                      color: white,
                    ),
              color: dao.isLocked ? baseColor : grey,
            ),
          ],
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
