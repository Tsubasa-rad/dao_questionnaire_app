
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextCopyButton extends StatelessWidget {
  const TextCopyButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // テキストをクリップボードにコピー
          Clipboard.setData(
              ClipboardData(text: text));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('コピーしました: ${text}')),
          );
        },
        child: const Row(
          children: [Icon(Icons.copy), Text("コピー")],
        ),
      );
  }
}
