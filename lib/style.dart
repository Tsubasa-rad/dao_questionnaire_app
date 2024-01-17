// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

const Color white = Color.fromARGB(255, 255, 255, 255);
const Color black = Color.fromARGB(255, 0, 0, 0);
const Color grey = Color.fromARGB(255, 92, 92, 92);
const Color whiteBlack = Color.fromARGB(255, 198, 196, 196);
const Color fontColor = Color.fromARGB(255, 0, 0, 0);
const Color baseColor = Color.fromARGB(255, 24, 123, 244);
const Color baseOpacityColor = Color.fromARGB(255, 0, 255, 255);
const Color blue = Color.fromARGB(255, 0, 94, 255);
const Color qrCodeBackColor = Color.fromARGB(255, 255, 253, 193);

class Styles {
  static TextStyle TitleStyle =
      TextStyle(fontSize: 25, color: fontColor, fontWeight: FontWeight.bold);
  static TextStyle appBarTitleStyle =
      TextStyle(fontSize: 18, color: fontColor, fontWeight: FontWeight.bold);
  static TextStyle textStyle =
      TextStyle(fontSize: 16, color: fontColor, fontWeight: FontWeight.w500);
  static TextStyle oathTextStyle =
      TextStyle(fontSize: 15, color: fontColor, fontWeight: FontWeight.w500);
  static TextStyle categoryTextStyle =
      TextStyle(fontSize: 17, color: grey, fontWeight: FontWeight.bold);
  static TextStyle questionTextStyle =
      TextStyle(fontSize: 20, color: fontColor, fontWeight: FontWeight.w500);
  static TextStyle questionTextLastStyle =
      TextStyle(fontSize: 20, color: fontColor, fontWeight: FontWeight.bold);
  static TextStyle tabTextStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
  static TextStyle urlStyle =
      const TextStyle(fontSize: 17, color: blue, fontWeight: FontWeight.w600);
  static TextStyle searchTitleStyle =
      TextStyle(fontSize: 22, color: fontColor, fontWeight: FontWeight.w600);
  static TextStyle menuTextStyle = TextStyle(
    color: white,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        color: fontColor,
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
  );

  static BoxDecoration questionCardDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.bottomRight,
        colors: [
          baseColor.withOpacity(0.6),
          white.withOpacity(0.6),
        ],
        stops: const [
          0.0,
          1.0,
        ]),
    boxShadow: [
      Styles.shadowCard,
    ],
  );

  static BoxDecoration faqCardDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      Styles.shadowCard,
    ],
  );
  static BoxDecoration blueFrame = BoxDecoration(
    border: Border.all(
      color: blue,
      width: 3.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  static BoxDecoration topScreenDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [
          white.withOpacity(0.5),
          white.withOpacity(1),
        ],
        stops: const [
          0.0,
          1.0,
        ]),
  );
  static BoxDecoration searchConnectionDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(15),
    // gradient: Styles.TitleSty,
    boxShadow: [
      Styles.shadowCard,
    ],
  );

  static BoxDecoration promptCardDecotation = BoxDecoration(
    color: white, borderRadius: BorderRadius.circular(10),
    // gradient: Styles.TitleSty,
    boxShadow: [
      Styles.shadowCard,
    ],
  );
  static BoxShadow shadowCard = const BoxShadow(
    color: whiteBlack, // シャドウの色
    spreadRadius: 2, // シャドウの拡がり具合
    blurRadius: 5, // シャドウのぼかし具合
    offset: Offset(0, 3), // シャドウの位置
  );
  
}
