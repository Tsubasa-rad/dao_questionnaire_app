// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';
// カードのデザイン
class CardImageGesture extends StatefulWidget {
  const CardImageGesture({
    super.key,
    required this.cardWidth,
    required this.CardHeight,
    required this.cardImageAssetName,
    required this.topText,
    required this.centerText,
    required this.bottomText,
    this.cardRadius = 35,
    this.gradientColor = black,
    this.fontColor = white,
  });

  final cardWidth, CardHeight;
  final String cardImageAssetName, topText, centerText, bottomText;
  final double cardRadius;
  final Color gradientColor, fontColor;

  @override
  State<CardImageGesture> createState() => _CardImageGestureState();
}

class _CardImageGestureState extends State<CardImageGesture> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: widget.cardWidth,
          height: widget.CardHeight,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(widget.cardRadius), // 角丸にする
            image: DecorationImage(
              image: AssetImage(widget.cardImageAssetName), // 画像のパスを指定
              fit: BoxFit.cover, // 画像のフィットモードを指定
            ),
          ),
          child: Stack(
            children: [
              // 背景の設定、グラデーションの設定
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.cardRadius),
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        widget.gradientColor.withOpacity(0.1),
                        widget.gradientColor.withOpacity(0.7),
                      ],
                      stops: const [
                        0.0,
                        1.0,
                      ]),
                ),
              ),
              // カードのテキスト部分の設定
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisAlignment: widget.centerText != ""
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      cardText(widget.topText, 35, FontWeight.bold,
                          widget.fontColor),
                      if (widget.centerText != "")
                        cardText(widget.centerText, 22, FontWeight.w600,
                            widget.fontColor),
                      cardText(widget.bottomText, 10, FontWeight.w400,
                          widget.fontColor),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
// テキストの設定
  Text cardText(
      String text, double fontSize, FontWeight fontWeight, Color fontColor) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
      ),
      textAlign: TextAlign.center,
    );
  }
}
