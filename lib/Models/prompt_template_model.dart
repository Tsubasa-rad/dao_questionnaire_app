class PromptTemplateModel {
  final String title, templateText, adviceText;

  PromptTemplateModel({
    required this.title,
    required this.templateText,
    required this.adviceText,
  });
}

class PromptAddText {
  final String title, templateText, adviceText;

  PromptAddText(
      {required this.title,
      required this.templateText,
      required this.adviceText});
}

// #文脈
final promptAddText = [
  PromptAddText(
    title: "具体的な技術的なスキルの追加",
    templateText:
        "ユーザーのブロックチェーン技術に関する経験や知識に焦点を当て、具体的な技術的なスキルや取り組んだプロジェクトについて尋ねることが重要です。",
    adviceText: "プロンプトテンプレートに追加して入力を行うとより精度の高い解答を求める事ができます",
  )
];

final promptTemplateModel = [
  PromptTemplateModel(
    title: "※おすすめ",
    templateText: """
temperatureを0に設定して
上記のアンケートを行った人に下記の項目に従って回答を作成してください
#項目
・どのような点を踏まえてDAOやメンバーを判断すべきか？それぞれ300文字程度にまとめてください
・アンケートを行った人の効果的なプロフィールを250文字以内で作成してください""",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "※おすすめのDAOの検索",
    templateText: "上記のアンケートを行った人の特徴をコンマ区切りのCSV形式にして10個表示してください",
    adviceText: "コンマ区切りの文字列をアプリ内の検索に入力するとあなたにあったDAOの候補を表示します",
  ),
  PromptTemplateModel(
    title: "役割の設定(おすすめ)",
    templateText: """あなたは、DAOとメンバーのマッチングを行うアドバイザーです。""",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "役割の設定(おすすめ)",
    templateText: """あなたは一流のDAOと、メンバーをマチイングを行う担当です。
AIを利用した新しいサービスを企画しようと考えています。""",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "前提の設定(おすすめ)",
    templateText: """DAOと自分を入力データを元に最適なDAOについての情報を表示してほしいです""",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "おすすめのDAOの表示",
    templateText: "入力データをもとに私に適したDAOを3つ理由も追加して作成してください。",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "評価",
    templateText: "私を評価してください",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "評価",
    templateText: "私を評価して250文字以内で表示してください",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "DAOの作成提案サポート",
    templateText: "私がDAOを作成するとしてどのようなDAOを作ればいいですか？",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "DAOの作成提案サポート",
    templateText:
        "私がDAOを作成するとして以下のフォーマットで表示してください\n仮のDAO名前:\nDAOの特徴:\nガバナンス:\n目的:\nコミュニティの対象:\nインセンティブ:\nトークン:\n技術スタック:",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "調整",
    templateText: "具体例を足して",
    adviceText: "",
  ),
  PromptTemplateModel(
    title: "調整",
    templateText: "追加の情報が必要なら質問してください",
    adviceText: "",
  ),
];
