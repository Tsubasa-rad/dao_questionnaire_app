
import 'package:dao_questionnaire_app/Models/dao_question_model.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Screens/question_detail_screen.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({
    super.key,
    required this.size,
    required this.color,
    required this.index,
    required this.title,
    required this.title2,
    required this.answer,
    required this.data,
    required this.cardIndex,
    this.dataBool = true,
  });

  final Size size;
  final Color color;
  final int index, cardIndex;
  final String title, title2, answer;
  final List<Map<String, dynamic>> data;
  final bool dataBool;

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  // List<Map<String, dynamic>> dataList;

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final int cardComment = 3;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
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
                    text: daoList[widget.index].detail, color: widget.color);
              },
            );
          },
          child: Container(
            width: widget.size.width - 30,
            decoration: BoxDecoration(
              color: widget.color.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                Styles.shadowCard,
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "問 ${widget.index + 1}",
                      style: Styles.textStyle,
                    ),
                    if (widget.dataBool)
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_document,
                          size: 20,
                        ),
                      )
                  ],
                ),
                Text(
                  "  ${widget.title}",
                  style: Styles.questionTextLastStyle,
                ),
                Text(
                  "  ${widget.title2}",
                  style: Styles.textStyle,
                ),
                SizedBox(height: 10),
                const Text("アンサー"),
                Text(
                  "  ${widget.answer}",
                  style: Styles.textStyle,
                ),

                // コメントの設定
                if (widget.dataBool)
                  GestureDetector(
                    onTap: () {},
                    child: widget.data[widget.cardIndex]['list'][widget.index]
                                [cardComment] !=
                            ""
                        ? Container(
                            width: widget.size.width,
                            decoration: BoxDecoration(
                              color: widget.color.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                Styles.shadowCard,
                              ],
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("コメント"),
                                SizedBox(height: 10),
                                Text(
                                  "${widget.data[widget.cardIndex]['list'][widget.index][3]}",
                                  style: Styles.textStyle,
                                ),
                              ],
                            ),
                          )
                        : Text("コメントなし"),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
