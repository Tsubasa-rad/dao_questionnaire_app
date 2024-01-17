// ignore_for_file: prefer_const_constructors, prefer_is_empty, no_leading_underscores_for_local_identifiers, prefer_const_declarations
import 'package:dao_questionnaire_app/Models/home_card_model.dart';
import 'package:dao_questionnaire_app/Models/middle_card_model.dart';
import 'package:dao_questionnaire_app/Views/Home/Widgets/card_image_gesture.dart';
import 'package:dao_questionnaire_app/Views/Home/Widgets/custom_drawer.dart';
import 'package:dao_questionnaire_app/Views/Home/Widgets/home_middle_card.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/questionnaire_view.dart';
import 'package:dao_questionnaire_app/database/data_storage.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 保存データセットを作成(取得)する
  final DataStorage dataStorage = DataStorage();
  List<Map<String, dynamic>> dataList = [];
  @override
  void initState() {
    super.initState();
    loadDataList();
  }

  Future<void> loadDataList() async {
    final List<Map<String, dynamic>> loadedData = await dataStorage.loadData();
    setState(() {
      dataList = loadedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final copyright = "©︎ 2022 Wings Man Inc.";
    return Scaffold(
      appBar: AppBar(
        // AppBarの左側にアイコンを配置し、押されたときにDrawerを表示
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        toolbarHeight: 30,
      ),
      drawer: CustomDrawer(
          copyright: copyright, homeCardModel: homeCardModel), // メニューバーの表示
      body: RefreshIndicator(
        onRefresh: loadDataList,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // home_card_modelから取得したデータからカードデザインと画面遷移の処理をリストにして表示
              ...List.generate(
                homeCardModel.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => index == 1
                              ? QuestionnaireView(
                                  dataList: dataList,
                                  imageUrl: 'assets/images/dao002.jpg',
                                )
                              : homeCardModel[index].ontap,
                          fullscreenDialog: true),
                    );
                  },
                  child: CardImageGesture(
                    cardWidth: size.width,
                    CardHeight: size.width / homeCardModel[index].heightSize,
                    cardImageAssetName: homeCardModel[index].imageURL,
                    topText: homeCardModel[index].title,
                    centerText: homeCardModel[index].centerText,
                    bottomText: copyright,
                  ),
                ),
              ),
              // 利用規約書、アプリについてのページ
              Center(
                child: Wrap(
                  runSpacing: 15,
                  spacing: 10,
                  children: middleCardModel
                      .map((cardModel) => HomeMiddleCard(cardModel: cardModel))
                      .toList(),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
