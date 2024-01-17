import 'package:dao_questionnaire_app/Models/dao_question_model.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class QuestionsWidget extends StatelessWidget {
  final DAOQuestionModel question;
  final ValueChanged<OptionModel> onClickedOption;
  const QuestionsWidget(
      {super.key, required this.question, required this.onClickedOption});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.option.map((e) => buildOption(context, e)).toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, OptionModel option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Row(
          children: [
            Text(
              "${option.optionId}:",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                option.option,
                softWrap: true,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(OptionModel option, DAOQuestionModel question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return baseColor;
      }
    }
    return Colors.grey.shade300;
  }
}
