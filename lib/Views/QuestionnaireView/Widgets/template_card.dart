// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:dao_questionnaire_app/Widgets/text_copy_button.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';
// プロンプトテンプレートカードの設定
class TemplateCard extends StatefulWidget {
  const TemplateCard({
    super.key,
    required this.title,
    required this.templateText,
    required this.adviceText,
    this.topCard = false,
    this.tapCopy = true,
  });
  final String title, templateText, adviceText;
  final bool topCard, tapCopy;

  @override
  State<TemplateCard> createState() => _TemplateCardState();
}

class _TemplateCardState extends State<TemplateCard> {
  bool isTapped = false;
  bool isAdvice = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(20), // 角丸にする
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              getRandomColor().withOpacity(0.3),
              getRandomColor().withOpacity(1),
            ],
            stops: const [
              0.0,
              1.0,
            ],
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: white,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                    color: black,
                  ),
                ],
              ),
            ),
            widget.topCard
                ? widget.tapCopy
                    ? TextCopyButton(text: widget.templateText)
                    : SizedBox()
                : SizedBox(),
            if (widget.topCard == false)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isTapped = !isTapped;
                        });
                      },
                      child: Icon(
                        isTapped
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 30,
                      )),
                  isTapped
                      ? Row(
                          children: [
                            widget.adviceText == ""
                                ? SizedBox()
                                : ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(30),
                                          ),
                                        ),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return showAdviceSheet();
                                        },
                                      );
                                    },
                                    child: Text("アドバイス"),
                                  ),
                            SizedBox(width: 10),
                            if (widget.tapCopy)
                              TextCopyButton(text: widget.templateText)
                          ],
                        )
                      : Spacer()
                ],
              ),
            isTapped == true
                ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: SelectableText(widget.templateText),
                  )
                : SizedBox(),
            if (widget.topCard)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: SelectableText(widget.templateText),
              ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Container showAdviceSheet() {
    return Container(
      decoration: BoxDecoration(
        color: blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Text(
            "やり方(アドバイス）",
            style: Styles.TitleStyle,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Text(widget.adviceText),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
// 背景の色をランダムに設定
  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}
