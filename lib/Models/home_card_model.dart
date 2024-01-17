// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:dao_questionnaire_app/Views/ChatGPTQuestion/chat_questions_screen.dart';
import 'package:dao_questionnaire_app/Views/MyPrompt/my_prompt_screen.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireResults/questionnaire_results_screen.dart';
import 'package:dao_questionnaire_app/Views/QuestionnaireView/questionnaire_view.dart';
import 'package:dao_questionnaire_app/Views/Search/search_screen.dart';

class HomeCardModel {
  final String title, centerText, imageURL;
  final ontap;
  final double heightSize;

  HomeCardModel({
    required this.title,
    required this.centerText,
    required this.imageURL,
    required this.ontap,
    required this.heightSize,
  });
}


  // ランダムな画像を選択するメソッド
  int getRandomImage(int i) {
    Random random = Random();
    int index = 1 + random.nextInt(i);
    return index;
  }
    final chatPageImageURL = "assets/images/chat${getRandomImage(4)}.jpg";
// カードのタイトルやNEXTページなど
final List<HomeCardModel> homeCardModel = [
  // DAOマッチングアプリ 登録をしたアンケート結果の閲覧ページ
  HomeCardModel(
    title: "DAO マッチングアプリ",
    centerText: "あなたにマッチしたDAO(自立分散型組織)や組織を簡単なアンケートを通して\nマッチングの候補を表示します",
    imageURL: "assets/images/dao003.jpg",
    ontap: MyPromptScreen(
      title: "プロンプト",
      imageURL: 'assets/images/dao003.jpg',
    ),
    heightSize: 1.7,
  ),
  // アンケート実施ページ
  // home_viewで例外処理をして画面遷移のみ別の処理が行われている
  HomeCardModel(
    title: "アンケート",
    centerText: "DAOとあなたをマッチングするためのアンケートを開始する",
    imageURL: 'assets/images/dao002.jpg',
    ontap: QuestionnaireView(
      dataList: [],
      imageUrl: 'assets/images/dao002.jpg',
    ),
    heightSize: 1.7,
  ),
  // DAOマッチングチャット形式アンケート
  HomeCardModel(
    title: "チャット形式アンケート",
    centerText: "",
    imageURL: chatPageImageURL,
    ontap: ChatQuestionsScreen(
      title: "チャット形式アンケート",
      imageURL: chatPageImageURL,
    ),
    heightSize: 2.3,
  ),
  // アンケート結果ページ
  HomeCardModel(
    title: "マッチング結果",
    centerText: "",
    imageURL: 'assets/images/dao001.jpg',
    ontap: QuestionnaireResultsScreen(
      imageUrl: 'assets/images/dao001.jpg',
    ),
    heightSize: 2.3,
  ),
  // アンケート結果からDAO検索
  HomeCardModel(
    title: "DAO検索",
    centerText: "アンケート結果からあなたにあったDAOをアプリ内データベースから見つける事ができます",
    imageURL: 'assets/images/dao_${getRandomImage(9)}.jpg',
    ontap: SearchScreen(),
    heightSize: 1.5,
  ),
];
