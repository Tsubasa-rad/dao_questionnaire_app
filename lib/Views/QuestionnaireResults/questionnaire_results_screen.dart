// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:dao_questionnaire_app/Models/prompt_template_model.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireResults/Widgets/questionnaire_results_card.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/Widgets/template_card.dart';
import 'package:dao_questionnaire_app/database/data_storage.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class QuestionnaireResultsScreen extends StatefulWidget {
  const QuestionnaireResultsScreen({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<QuestionnaireResultsScreen> createState() =>
      _QuestionnaireResultsScreenState();
}

class _QuestionnaireResultsScreenState
    extends State<QuestionnaireResultsScreen> {
  final DataStorage dataStorage = DataStorage();
  List<Map<String, dynamic>> dataList = [];
  @override
  void initState() {
    super.initState();
    loadDataList();
  }
// データの読み取り
  Future<void> loadDataList() async {
    final List<Map<String, dynamic>> loadedData = await dataStorage.loadData();
    setState(() {
      dataList = loadedData;
    });
  }

  Future<void> refreshDataList() async {
    await loadDataList();
  }

  TextEditingController textController = TextEditingController();
// データの削除
  Future<void> editDataItem(String id) async {
    final String newData = textController.text;
    if (newData.isNotEmpty) {
      await dataStorage.editData(id, newData);
      await loadDataList();
      setState(() {
        textController.clear();
      });
    }
  }
// アンケート結果の表示
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
            actions: [
              IconButton(
                  onPressed: () {
                    loadDataList();
                  },
                  icon: Icon(Icons.refresh))
            ],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  title: Text(
                    'マッチング結果',
                    style: Styles.TitleStyle,
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imageUrl), // 画像のパスを指定
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
            delegate: SliverChildListDelegate(
              [
                dataList.length != 0
                    ? Column(
                        children: [
                          ...List.generate(
                            dataList.length,
                            (index) => QuestionnaireResultsCard(
                              dataList: dataList,
                              index: index,
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            "現在DAOマッチングアンケート結果データが保存されていません",
                            style: Styles.TitleStyle,
                          ),
                        ),
                      ),
                      // プロンプトのテンプレートをリストで表示
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: Styles.blueFrame,
                    child: Column(
                      children: [
                        Text(
                          "プロンプトテンプレート:命令文",
                          style: Styles.TitleStyle,
                        ),
                        ...List.generate(
                          promptTemplateModel.length,
                          (index) => TemplateCard(
                            title: promptTemplateModel[index].title,
                            templateText:
                                promptTemplateModel[index].templateText,
                            adviceText: promptTemplateModel[index].adviceText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
