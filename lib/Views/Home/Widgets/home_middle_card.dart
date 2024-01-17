// ignore_for_file: sized_box_for_whitespace

import 'package:dao_questionnaire_app/Models/middle_card_model.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class HomeMiddleCard extends StatelessWidget {
  final MiddleCardModel cardModel;
  const HomeMiddleCard({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2 - 20,
      // height: size.width / 3.5,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 10,
            offset: Offset(5, 7),
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => cardModel.ontap,
              fullscreenDialog: true,
            ),
          );
        },
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: white,
            // カードのカラーにグラデーションをつける
            gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  cardModel.color1.withOpacity(0.6),
                  cardModel.color2.withOpacity(0.6),
                ],
                stops: const [
                  0.0,
                  1.0,
                ]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              Styles.shadowCard,
            ],//シャドーをつける
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                cardModel.icon,
                size: size.width / 10,
                color: baseOpacityColor,
              ),//カードの処理をイメージできるアイコンの設置
              const SizedBox(width: 5),
              // カードのタイトルの設定
              Container(
                width: size.width / 5,
                child: Text(
                  cardModel.title,
                  style: Styles.textStyle,
                  softWrap: true, // テキストを折り返すかどうかを設定
                  overflow: TextOverflow.fade, // 文字がはみ出した場合にフェードアウトする
                  maxLines: 2, // 表示する最大行数
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
