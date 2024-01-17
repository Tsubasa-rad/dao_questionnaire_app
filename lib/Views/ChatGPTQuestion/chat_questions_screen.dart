import 'package:dao_questionnaire_app/Models/chat_question_model.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Widgets/template_card.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class ChatQuestionsScreen extends StatefulWidget {
  final String title, imageURL;
  const ChatQuestionsScreen(
      {super.key, required this.title, required this.imageURL});

  @override
  State<ChatQuestionsScreen> createState() => _ChatQuestionsScreenState();
}

class _ChatQuestionsScreenState extends State<ChatQuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: white,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            actions: [],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  title: Text(
                    widget.title,
                    style: Styles.TitleStyle,
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imageURL), // 画像のパスを指定
                        fit: BoxFit.cover, // 画像のフィットモードを指定
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(decoration: Styles.topScreenDecoration),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  TemplateCard(
                    title: "自然言語処理への入力プロンプト",
                    templateText: prompt,
                    adviceText: "",
                    topCard: true,
                  ),
                  Divider(),
                  Text(
                    "このアンケートにより得られる効果",
                    style: Styles.TitleStyle,
                  ),
                  ...List.generate(
                    effectOfInput.length,
                    (index) => TemplateCard(
                      title: effectOfInput[index].title,
                      templateText: effectOfInput[index].effectText,
                      adviceText: "",
                      topCard: true,
                      tapCopy: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "※現状ChatGPT3.5での動作確認済み(その他の生成AIでも同等の効果を得られると考えます)"),
                  ),
                  SizedBox(height: 35),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
