class FAQModel {
  final int number;
  final String title, data;

  FAQModel({
    required this.number,
    required this.title,
    required this.data,
  });
}

List faqModel = [
  FAQModel(
    number: 1,
    title: "データの保存環境は、どのようになっていますか?",
    data:
        "現状は、アプリ内での保存のみとなっています。データベースなどへの外部への保存は、されていません。\nしかし、今後のアップデートでデータベースなどへの保存の可能性は、あります。\nご理解とご協力をよろしくお願いします",
  ),
];
