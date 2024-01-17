// ignore_for_file: prefer_const_constructors

import 'package:dao_questionnaire_app/Widgets/text_copy_button.dart';
import 'package:dao_questionnaire_app/Widgets/text_length.dart';
import 'package:dao_questionnaire_app/database/data_storage.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';
// 保存されているアンケート結果のカードの画面の設定
class QuestionnaireResultsCard extends StatefulWidget {
  const QuestionnaireResultsCard({
    super.key,
    required this.dataList,
    required this.index,
  });

  final List<Map<String, dynamic>> dataList;
  final int index;

  @override
  State<QuestionnaireResultsCard> createState() =>
      _QuestionnaireResultsCardState();
}

class _QuestionnaireResultsCardState extends State<QuestionnaireResultsCard> {
  final DataStorage dataStorage = DataStorage();
  List<Map<String, dynamic>> dataList = [];
// データ取得
  Future<void> loadDataList() async {
    final List<Map<String, dynamic>> loadedData = await dataStorage.loadData();
    setState(() {
      dataList = loadedData;
    });
  }
// データの削除
  Future<void> deleteDataItem(String id) async {
    await dataStorage.deleteData(id);
    await loadDataList();
  }

  @override
  Widget build(BuildContext context) {
    // 保存されているデータの保存時間を取得
    String dateTime = widget.dataList[widget.index]["time"];
    int no = widget.index + 1;

    int indexOfSpace = dateTime.indexOf(' ');
    String date =
        indexOfSpace >= 0 ? dateTime.substring(0, indexOfSpace) : dateTime;
    return Container(
      decoration: Styles.promptCardDecotation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("No.${no}", style: Styles.TitleStyle),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "作成:${date}",
                    ),
                    Text(
                      "DAOアンケート ",
                    ),
                  ],
                ),
                TextCopyButton(
                  text: widget.dataList[widget.index]['promptTMP'],
                ),
                IconButton(
                    onPressed: () {
                      deleteDataItem(widget.dataList[widget.index]['id']);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          Text(
            "プロンプトテンプレート",
            style: Styles.categoryTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    Styles.shadowCard,
                  ],
                ),
                padding: EdgeInsets.all(5),
                child: TextLength(
                  caption: widget.dataList[widget.index]['promptTMP'],
                  count: 150,
                )),
          ),
        ],
      ),
    );
  }
}
