import 'package:dao_questionnaire_app/Models/written_oath_text_model.dart';
import 'package:dao_questionnaire_app/style.dart';
import 'package:flutter/material.dart';

class PledgeScreen extends StatelessWidget {
  const PledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "利用誓約書",
          style: Styles.TitleStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                writtenOathText,
                style: Styles.oathTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
