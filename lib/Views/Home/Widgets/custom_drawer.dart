// ignore_for_file: prefer_const_constructors

import 'package:dao_questionnaire_app/Models/home_card_model.dart';
import 'package:dao_questionnaire_app/Models/middle_card_model.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';
// タップ後に表示するメニューバーの設定
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.copyright,
    required this.homeCardModel,
  });

  final String copyright;
  final List<HomeCardModel> homeCardModel;

  @override
  Widget build(BuildContext context) {
    String title = "メニュー";
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // トップのタイトルと背景の設定
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: baseOpacityColor,
              ),
              padding: EdgeInsets.all(5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: Styles.TitleStyle,
                    ),
                    Text(copyright),
                  ],
                ),
              ),
            ),
            // ホーム画面に並んでいるカード
            ...List.generate(
              homeCardModel.length,
              (index) => topCard(context, index),
            ),
            // ホームの下部に並んでいるアプリの設定などのカード
            ...List.generate(
              middleCardModel.length,
              (index) => middleCard(context, index),
            )
          ],
        ),
      ),
    );
  }
// 下部のカードのデザインと画面遷移の設定
  GestureDetector middleCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => middleCardModel[index].ontap,
              fullscreenDialog: true),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  middleCardModel[index].color1.withOpacity(0.6),
                  middleCardModel[index].color2.withOpacity(0.6),
                ],
                stops: const [
                  0.0,
                  1.0,
                ]),
          ),
          child: Center(
            child: Text(
              middleCardModel[index].title,
              style: Styles.menuTextStyle,
            ),
          ),
        ),
      ),
    );
  }
// カードのデザインと画面遷移処理
  GestureDetector topCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => homeCardModel[index].ontap,
              fullscreenDialog: true),
        );
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(homeCardModel[index].imageURL), // 画像のパスを指定
            fit: BoxFit.cover, // 画像のフィットモードを指定
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        black.withOpacity(0.1),
                        black.withOpacity(0.7),
                      ],
                      stops: const [
                        0.0,
                        1.0,
                      ]),
                ),
              ),
              Center(
                child: Text(
                  homeCardModel[index].title,
                  style: Styles.menuTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
