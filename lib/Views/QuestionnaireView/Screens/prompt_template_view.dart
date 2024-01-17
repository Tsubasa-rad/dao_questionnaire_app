import 'package:dao_questionnaire_app/Models/prompt_template_model.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Screens/result_screen.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Widgets/template_card.dart';
import 'package:flutter/material.dart';

class PromptTemplateView extends StatelessWidget {
  final String generateText;
  final ResultScreen widget;
  final Size size;
  const PromptTemplateView({
    super.key,
    required this.widget,
    required this.size,
    required this.generateText,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateCard(
            title: "あなたのアンケート結果から入力データを作成",
            templateText: generateText,
            topCard: true,
            adviceText: "",
          ),
          ...List.generate(
            promptTemplateModel.length,
            (index) => TemplateCard(
              title: promptTemplateModel[index].title,
              templateText: promptTemplateModel[index].templateText,
              adviceText: promptTemplateModel[index].adviceText,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
