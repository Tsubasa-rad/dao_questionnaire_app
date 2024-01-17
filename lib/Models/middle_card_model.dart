// ignore_for_file: prefer_const_constructors

import 'package:dao_questionnaire_app/Views/Settings/AppSettings/app_question_screen.dart';
import 'package:dao_questionnaire_app/Views/Settings/Pledge/pledge_screen.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class MiddleCardModel {
  final String title;
  final icon;
  final ontap;
  final Color color1, color2;

  MiddleCardModel({
    required this.title,
    required this.icon,
    this.ontap,
    required this.color1,
    required this.color2,
  });
}

final middleCardModel = [
  MiddleCardModel(
    title: '利用誓約書',
    icon: Icons.fact_check_outlined,
    ontap: PledgeScreen(),
    color1: Colors.yellow,
    color2: baseColor,
  ),
  MiddleCardModel(
    title: 'アプリについての質問',
    icon: Icons.lightbulb_circle_outlined,
    ontap: AppQuestionScreen(),
    color1: baseColor,
    color2: Colors.pink,
  ),
];
