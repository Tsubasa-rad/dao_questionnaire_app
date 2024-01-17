// ignore_for_file: prefer_const_constructors

import 'package:dao_questionnaire_app/Models/dao_question_model.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Screens/result_screen.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Widgets/check_box.dart';
import 'package:flutter/material.dart';

class AnswerListView extends StatelessWidget {
  const AnswerListView({
    super.key,
    required this.widget,
    required this.size,
  });

  final ResultScreen widget;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            widget.myAnswer.length,
            (index) => daoList[widget.myAnswer[index][0]].quiz
                ? SizedBox()
                : CheckBox(
                    size: size,
                    color: daoList[widget.myAnswer[index][0]].color,
                    index: index,
                    title: daoList[widget.myAnswer[index][0]].question,
                    title2: daoList[widget.myAnswer[index][0]].question2,
                    answer: widget.myAnswer[index][1],
                    data: widget.dataList, cardIndex: index, dataBool: false,
                  ),
          ),
        ],
      ),
    );
  }
}
