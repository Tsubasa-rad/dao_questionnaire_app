import 'package:dao_questionnaire_app/Models/question_text_model.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Screens/check_box_screen.dart';
import 'package:dao_questionnaire_app/Widgets/button_widget.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class QuestionnaireView extends StatefulWidget {
  final List<Map<String, dynamic>> dataList;
  final String imageUrl;
  const QuestionnaireView({
    super.key,
    required this.dataList,
    required this.imageUrl,
  });

  @override
  State<QuestionnaireView> createState() => _QuestionnaireViewState();
}

class _QuestionnaireViewState extends State<QuestionnaireView> {
  String _inputText = 'DAOとマッチングアンケート';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: white,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  title: Text(
                    _inputText,
                    style: Styles.appBarTitleStyle,
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/dao002.jpg'), // 画像のパスを指定
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "DAO(自立分散型組織)とあなたを最適なマッチングを行うために作成されたアンケートになっています",
                          style: Styles.textStyle,
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: size.height / 2.5,
                          decoration: Styles.blueFrame,
                          padding: EdgeInsets.all(10),
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              Text(
                                "注意事項",
                                style: Styles.textStyle,
                              ),
                              Text(
                                questionText,
                                style: Styles.oathTextStyle,
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckBoxScreen(
                          title: _inputText,
                          dataList: widget.dataList,
                        ),
                        fullscreenDialog: true,
                      ),
                    ),
                    child: const Text("アンケートを開始する"),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          content: text != ""
              ? Text('このタイトルで保存されます\nでアンケートを開始しますか？')
              : Text("タイトルを設定してください"),
          actions: [
            ButtonWidget(
              text: "閉じる",
              icon: Icon(
                Icons.cancel,
                color: white,
              ),
              color: Colors.red,
              textColor: white,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            text != ""
                ? ButtonWidget(
                    text: "アンケートを開始する",
                    icon: Icon(
                      Icons.start_outlined,
                      color: white,
                    ),
                    color: baseColor,
                    textColor: white,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckBoxScreen(
                          title: _inputText,
                          dataList: widget.dataList,
                        ),
                        fullscreenDialog: true,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
