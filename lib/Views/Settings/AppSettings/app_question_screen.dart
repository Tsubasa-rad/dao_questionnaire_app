import 'package:dao_questionnaire_app/Models/faq_model.dart';
import 'package:dao_questionnaire_app/Views/Settings/AppSettings/Widgets/questionCard.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class AppQuestionScreen extends StatelessWidget {
  const AppQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String url = "https://forms.gle/fqvMQJucqVf2PtTo7";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "アプリについての質問",
          style: Styles.TitleStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuestionCard(url: url),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: Styles.blueFrame,
                child: Column(
                  children: [
                    Text(
                      "よくある質問",
                      style: Styles.TitleStyle,
                    ),
                    ...List.generate(
                      faqModel.length,
                      (index) => FAQCard(
                        faq: faqModel[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQCard extends StatefulWidget {
  final FAQModel faq;
  const FAQCard({super.key, required this.faq});

  @override
  State<FAQCard> createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  bool onTapGesture = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            onTapGesture = !onTapGesture;
          });
        },
        child: Container(
          decoration: Styles.faqCardDecoration,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.faq.title,
                style: Styles.tabTextStyle,
              ),
              SizedBox(height: 10),
              onTapGesture
                  ? Text(widget.faq.data)
                  : Center(
                      child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
