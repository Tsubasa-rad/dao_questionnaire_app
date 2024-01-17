// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:dao_questionnaire_app/Widgets/text_copy_button.dart';
import 'package:dao_questionnaire_app/database/dao_database.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, List<String>>> searchResult = [];
  List searchList = [];
// DAOデータについての検索
  void search(String query) {
    searchResult.clear();
    if (query.isEmpty) {
      // 検索クエリが空の場合、全ての項目を表示
      searchResult.addAll(daoDatabase);
    } else {
      // スペースでクエリを分割し、各単語で検索を行う
      final keywords = query.split(',');
      searchList = keywords;

      for (final map in daoDatabase) {
        final matchingItems = map.entries.where((entry) {
          return entry.value.any((item) {
            // 各単語で部分一致を検索
            return keywords.any((keyword) =>
                item.toLowerCase().contains(keyword.toLowerCase()));
          });
        }).toList();
        if (matchingItems.isNotEmpty) {
          searchResult
              .add({matchingItems.first.key: matchingItems.first.value});
        }
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    search("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検索'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'キーワードを入力してください:ブロックチェーン知識,DAOミッション理解,成長への意欲',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: search,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                final map = searchResult[index];
                final title = map.keys.first;
                final items = map[title]!;

                return searchBox(title, items);
              },
            ),
          ),
        ],
      ),
    );
  }
// 検索DAO(組織)のデータの表示
  Padding searchBox(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: Styles.searchConnectionDecoration,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DAO名",
                ),
                TextCopyButton(
                  text: title,
                ),
              ],
            ),
            SelectableText(
              title,
              style: Styles.searchTitleStyle,
            ),
            Divider(),
            Text("関連ワード"),
            Container(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final item in items)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: searchList.contains(item)
                                ? baseOpacityColor
                                : white,
                            borderRadius: BorderRadius.circular(15),
                            // gradient: Styles.TitleSty,
                            boxShadow: [
                              Styles.shadowCard,
                            ],
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            item,
                          ),
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
