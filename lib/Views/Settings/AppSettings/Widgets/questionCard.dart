
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 210,
        decoration: Styles.questionCardDecoration,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "質問フォーム",
                    style: Styles.TitleStyle,
                  ),
                  Text(
                    "公式",
                    style: Styles.textStyle,
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
            ),
            Spacer(),
            Text(
              "質問に関する回答のフォーマット",
              style: Styles.textStyle,
            ),
            SizedBox(height: 10),
            SelectableText(
              url,
              style: Styles.urlStyle,
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // テキストをクリップボードにコピー
                  Clipboard.setData(ClipboardData(text: url));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: baseColor,
                      content: Text('コピーしました: ${url}'),
                    ),
                  );
                },
                child: Text("URLコピー"),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
