
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.imageURL,
  });

  final String title, imageURL;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: white,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      actions: [],
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            title: Text(
              title,
              style: Styles.TitleStyle,
            ),
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageURL), // 画像のパスを指定
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
    );
  }
}
