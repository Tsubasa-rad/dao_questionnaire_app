import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class QuestionDetailScreen extends StatelessWidget {
final String text;
  final Color color;
  const QuestionDetailScreen({super.key, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
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
            "詳細について...",
            style: Styles.TitleStyle,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                text != ""
                    ? Text(
                        text,
                        style: Styles.textStyle,
                      )
                    : Text(
                        "この問いについての詳細は、ありません\n\n大変申し訳ありません",
                        style: Styles.textStyle,
                      ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: const Text("質問をする"),
                // )
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
