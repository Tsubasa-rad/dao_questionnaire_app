import 'package:flutter/material.dart';

class DAOQuestionModel {
  final int id;
  final String title;
  final String question;
  final String question2;
  final String detail;
  final List<OptionModel> option;
  bool isLocked;
  OptionModel? selectedOption;
  final Color color;
  final bool text;
  final bool quiz;
  DAOQuestionModel({
    required this.id,
    required this.title,
    required this.question,
    required this.question2,
    required this.detail,
    this.isLocked = false,
    required this.option,
    this.selectedOption,
    required this.color,
    this.text = false,
    this.quiz = false,
  });
}

class OptionModel {
  final String optionId;
  final String option;
  final String detail;
  final int nextNumber;

  OptionModel({
    required this.optionId,
    required this.option,
    required this.detail,
    required this.nextNumber,
  });
}

final daoList = [
  DAOQuestionModel(
    id: 0,
    title: "ブロックチェーン技術の理解度に関する質問",
    question: "ブロックチェーン技術は、理解していますか？",
    question2: "",
    detail:
        """この質問はメンバーのブロックチェーン技術への理解度を評価するための出発点となります。メンバーがブロックチェーン技術を理解しているかどうかは、DAO内での意思決定やプロジェクトへの参加において重要です。理解度が高いメンバーは、技術的な課題に理解を持ち、より効果的な協力が期待できます。質問の回答からは、メンバーの技術的なバックグラウンドや関心を把握し、適切なDAOにアサインするのに役立ちます。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "Yes",
          detail: "・ブロックチェーン技術に関する知識や経験がある",
          nextNumber: 1),
      OptionModel(
          optionId: "B",
          option: "No",
          detail: "・ブロックチェーン技術に関する知識や経験がないです。\n",
          nextNumber: 4),
      OptionModel(
          optionId: "C",
          option: "NEXT20",
          detail: "ブロックチェーンません",
          nextNumber: 20),
    ],
    color: Colors.green,
  ),
  DAOQuestionModel(
    id: 1,
    title: "ブロックチェーン技術の理解度に関する質問",
    question: "ブロックチェーンは、何のために使用される技術ですか？",
    question2: "",
    detail:
        "この質問は、一問目で答えていただいた質問に付随するものです。メンバーの具体的な技術的知識や深さを測定するための手段です。質問は、ブロックチェーンの基本的な仕組みや用語に関する質問から発展的な問題まで含むことがあります。この質問により、メンバーが単なる表面的な知識を持っているのか、深い理解を有しているのかを判断できます。これにより、DAO内での技術的な課題への対応能力や提案力を評価し、より適切なプロジェクトや役割にメンバーを割り当てるのに役立ちます。",
    option: [
      OptionModel(
          optionId: "A",
          option: "仮想現実の開発",
          detail: "と答えたが、ほとんど理解をしていない。\n",
          nextNumber: 4),
      OptionModel(
          optionId: "B",
          option: "トークンの交換",
          detail: "と答えたが、ほとんど理解をしていない。\n",
          nextNumber: 4),
      OptionModel(
          optionId: "C", option: "データの安全な管理", detail: "", nextNumber: 2), //A
      OptionModel(
          optionId: "D",
          option: "ウェブデザイン",
          detail: "と答えたが、ほとんど理解をしていない。\n",
          nextNumber: 4),
    ],
    color: Colors.green,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 2,
    title: "ブロックチェーン技術の理解度に関する質問",
    question: "ブロックチェーンにおける”スマートコントラクト”とは、何ですか？",
    question2: "",
    detail:
        "この質問は、一問目で答えていただいた質問に付随するものです。メンバーの具体的な技術的知識や深さを測定するための手段です。質問は、ブロックチェーンの基本的な仕組みや用語に関する質問から発展的な問題まで含むことがあります。この質問により、メンバーが単なる表面的な知識を持っているのか、深い理解を有しているのかを判断できます。これにより、DAO内での技術的な課題への対応能力や提案力を評価し、より適切なプロジェクトや役割にメンバーを割り当てるのに役立ちます。",
    option: [
      OptionModel(
          optionId: "A",
          option: "自己修正可能なブロック",
          detail: "が、具体的な仕組みや応用例については、あまり理解が深くないと考えられます。\n",
          nextNumber: 4),
      OptionModel(
          optionId: "B", option: "プログラム可能な契約条件", detail: "", nextNumber: 3), //A
      OptionModel(
          optionId: "C",
          option: "ブロックの自己暗号化",
          detail: "が、具体的な仕組みや応用例については、あまり理解が深くないと考えられます。\n",
          nextNumber: 4),
      OptionModel(
          optionId: "D",
          option: "高速なトランザクション",
          detail: "が、具体的な仕組みや応用例については、あまり理解が深くないと考えられます。\n",
          nextNumber: 4),
    ],
    color: Colors.green,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 3,
    title: "ブロックチェーン技術の理解度に関する質問",
    question: "ブロックチェーンにおける”フォーク”とは何ですか",
    question2: "",
    detail:
        "この質問は、一問目で答えていただいた質問に付随するものです。メンバーの具体的な技術的知識や深さを測定するための手段です。質問は、ブロックチェーンの基本的な仕組みや用語に関する質問から発展的な問題まで含むことがあります。この質問により、メンバーが単なる表面的な知識を持っているのか、深い理解を有しているのかを判断できます。これにより、DAO内での技術的な課題への対応能力や提案力を評価し、より適切なプロジェクトや役割にメンバーを割り当てるのに役立ちます。",
    option: [
      OptionModel(
          optionId: "A",
          option: "ブロックチェーンの新たな枝分かれ",
          detail:
              "さらに、ブロックチェーン技術のメリットとデメリットは何かを理解している可能性があります。また、ブロックチェーン技術の応用例のいくつかを理解している可能性もあります。\n",
          nextNumber: 4), //A
      OptionModel(
          optionId: "B",
          option: "マイニング報酬の削減",
          detail: "さらに、ブロックチェーン技術のメリットとデメリットは何かを理解している可能性があります。\n",
          nextNumber: 4),
      OptionModel(
          optionId: "C",
          option: "ブロックの結合方法",
          detail: "さらに、ブロックチェーン技術のメリットとデメリットは何かを理解している可能性があります。\n",
          nextNumber: 4),
      OptionModel(
          optionId: "D",
          option: "セキュリティの強化",
          detail: "さらに、ブロックチェーン技術のメリットとデメリットは何かを理解している可能性があります。\n",
          nextNumber: 4),
    ],
    color: Colors.green,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 4,
    title: "オープンソースプロジェクトへの参加経験",
    question: "オープンソースプロジェクトの参加経験は、ありますか？",
    question2:
        "オープンソースプロジェクトとは、ソースコードが公開され、誰でも自由に利用、改変、再配布することができる仕組みのことを示します。\nオープンソースプロジェクトについて、わからない場合は、”参加経験がない”を選択してください",
    detail:
        "この質問により個人のDAO関連の開発や協力経験を評価するためのものです。この質問により、候補者が分散型自治組織（DAO）の原則やテクノロジーに関心を寄せ、それに積極的に参加しているかどうかを把握できます。オープンソースのDAOプロジェクトへの参加は、分散協力やイノベーションの一環として重要です。候補者の経験からは、彼らがDAOの原則や技術に理解を持ち、コミュニティとの協力にどれだけ積極的かが見て取れます。これは、DAO関連のプロジェクトにおける適応力や貢献度を予測する上で重要な手がかりとなります。",
    option: [
      OptionModel(
          optionId: "A",
          option: "参加経験なし",
          detail: "・オープンソースプロジェクトへの参加経験は、ありません。\n",
          nextNumber: 9),
      OptionModel(
          optionId: "B",
          option: "1回貢献経験がある",
          detail: "・オープンソースプロジェクトへの参加経験は、あります。",
          nextNumber: 5),
      OptionModel(
          optionId: "C",
          option: "数回の貢献経験が有る",
          detail: "・オープンソースプロジェクトへの参加経験は、数回あります。",
          nextNumber: 5),
      OptionModel(
          optionId: "D",
          option: "継続的に貢献している",
          detail: "・オープンソースプロジェクトへの参加経験は、継続的にあります。",
          nextNumber: 5),
    ],
    color: Colors.red,
  ),
  DAOQuestionModel(
    id: 5,
    title: "オープンソースプロジェクトへの参加経験",
    question: "オープンソースプロジェクトとDAO（分散自治組織）の説明の組み合わせで正しいのは、どれですか？",
    question2: "",
    detail:
        "この質問の目的は、候補者が分散型自治組織（DAO）に関するオープンソースプロジェクトにどれだけ深く関与しているかを理解することです。候補者が過去に参加したプロジェクトやその成果に基づいて、彼らのDAOに対する理解度やスキルを評価します。オープンソースプロジェクトへの参加は、コミュニティでの協力や実際のプロジェクト経験を通じて得られる価値を示唆します。候補者がコードの貢献だけでなく、議論や提案などで積極的に参加しているかどうかも考慮されます。これにより、候補者のDAOに関する専門的な洞察力や貢献度を判断し、最適なマッチングを行うのに役立ちます。",
    option: [
      OptionModel(
          optionId: "A",
          option: "プロジェクトの予算管理ツール・人工知能による組織管理システム",
          detail: "しかし、オープンソースプロジェクトへの理解は、ありません\n",
          nextNumber: 9),
      OptionModel(
          optionId: "B",
          option: "ソースコードが一般的に公開されているプロジェクト・人工知能による組織管理システム",
          detail: "しかし、オープンソースプロジェクトへの理解は、ありません\n",
          nextNumber: 9),
      OptionModel(
          optionId: "C",
          option: "ソースコードが一般的に公開されているプロジェクト・分散された意思決定と運営を行う組織",
          detail: "",
          nextNumber: 6), //A,
      OptionModel(
          optionId: "D",
          option: "プロジェクトの予算管理ツール・分散された意思決定と運営を行う組織",
          detail: "しかし、オープンソースプロジェクトへの理解は、ありません\n",
          nextNumber: 9),
      OptionModel(
          optionId: "E",
          option: "ソースコードが一般的に公開されているプロジェクト・デジタルアートの管理プラットフォーム",
          detail: "しかし、オープンソースプロジェクトへの理解は、ありません\n",
          nextNumber: 9),
    ],
    color: Colors.red,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 6,
    title: "オープンソースプロジェクトへの参加経験",
    question: "オープンソースプロジェクトの自分の役割はなんだと思いますか？",
    question2: "",
    detail:
        "この質問の目的は、候補者が分散型自治組織（DAO）に関するオープンソースプロジェクトにどれだけ深く関与しているかを理解することです。候補者が過去に参加したプロジェクトやその成果に基づいて、彼らのDAOに対する理解度やスキルを評価します。オープンソースプロジェクトへの参加は、コミュニティでの協力や実際のプロジェクト経験を通じて得られる価値を示唆します。候補者がコードの貢献だけでなく、議論や提案などで積極的に参加しているかどうかも考慮されます。これにより、候補者のDAOに関する専門的な洞察力や貢献度を判断し、最適なマッチングを行うのに役立ちます。",
    option: [
      OptionModel(
          optionId: "A",
          option: "独自で最先端のことを突き詰めてする",
          detail: "しかし、自分の役割や責任については、十分に理解していない。\n",
          nextNumber: 9),
      OptionModel(
          optionId: "B",
          option: "より早く開発などを行う",
          detail: "しかし、自分の役割や責任については、十分に理解していない。\n",
          nextNumber: 9),
      OptionModel(
          optionId: "C",
          option: "コミュニティの一員として開発などに参加する",
          detail: "",
          nextNumber: 7), //A
    ],
    color: Colors.red,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 7,
    title: "オープンソースプロジェクトへの参加経験",
    question: "オープンソースプロジェクトのライセンスの目的は何ですか？",
    question2: "",
    detail:
        "この質問の目的は、候補者が分散型自治組織（DAO）に関するオープンソースプロジェクトにどれだけ深く関与しているかを理解することです。候補者が過去に参加したプロジェクトやその成果に基づいて、彼らのDAOに対する理解度やスキルを評価します。オープンソースプロジェクトへの参加は、コミュニティでの協力や実際のプロジェクト経験を通じて得られる価値を示唆します。候補者がコードの貢献だけでなく、議論や提案などで積極的に参加しているかどうかも考慮されます。これにより、候補者のDAOに関する専門的な洞察力や貢献度を判断し、最適なマッチングを行うのに役立ちます。",
    option: [
      OptionModel(
          optionId: "A",
          option: "コードのバックアップ作成",
          detail: "さらに、自分の役割や責任については、理解している。しかし、ライセンスなどの用語への理解は、あまり詳しくない。\n",
          nextNumber: 9),
      OptionModel(
          optionId: "B",
          option: "利用者に使用料を請求するため",
          detail: "さらに、自分の役割や責任については、理解している。しかし、ライセンスなどの用語への理解は、あまり詳しくない。\n",
          nextNumber: 9),
      OptionModel(
          optionId: "C", option: "コードの利用条件を定める", detail: "", nextNumber: 8), //A
      OptionModel(
          optionId: "D",
          option: "プロジェクトの進捗を報告する",
          detail: "さらに、自分の役割や責任については、理解している。しかし、ライセンスなどの用語への理解は、あまり詳しくない。\n",
          nextNumber: 9),
    ],
    color: Colors.red,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 8,
    title: "オープンソースプロジェクトへの参加経験",
    question: "DAOにおける”クオラム”とは何ですか？",
    question2: "",
    detail:
        "この質問の目的は、候補者が分散型自治組織（DAO）に関するオープンソースプロジェクトにどれだけ深く関与しているかを理解することです。候補者が過去に参加したプロジェクトやその成果に基づいて、彼らのDAOに対する理解度やスキルを評価します。オープンソースプロジェクトへの参加は、コミュニティでの協力や実際のプロジェクト経験を通じて得られる価値を示唆します。候補者がコードの貢献だけでなく、議論や提案などで積極的に参加しているかどうかも考慮されます。これにより、候補者のDAOに関する専門的な洞察力や貢献度を判断し、最適なマッチングを行うのに役立ちます。",
    option: [
      OptionModel(
          optionId: "A",
          option: "参加者の多数決",
          detail: "さらに、自分の役割や責任についてや、用語などに関してもある程度理解をしている\n",
          nextNumber: 9),
      OptionModel(
          optionId: "B",
          option: "ネットワークの速度向上手段",
          detail: "さらに、自分の役割や責任についてや、用語などに関してもある程度理解をしている\n",
          nextNumber: 9),
      OptionModel(
          optionId: "C",
          option: "投票の有効性を確認する閾値",
          detail: "さらに、さらに、自分の役割や責任についてや、用語などに関してもとおても理解をしている\n",
          nextNumber: 9), //A
      OptionModel(
          optionId: "D",
          option: "トークンの総供給量",
          detail: "さらに、自分の役割や責任についてや、用語などに関してもある程度理解をしている\n",
          nextNumber: 9),
    ],
    color: Colors.red,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 9,
    title: "分散型意思決定への参加経験",
    question: "DAOへの参加経験は、どのくらいありますか？",
    question2: "",
    detail:
        "分散型意思決定への参加歴を把握することを意図しています。この質問に対する回答は、候補者がDAOの運営や決定プロセスに積極的に関与しているかどうかを示し、彼らの組織内での影響力や貢献度を評価します。経験がない場合でも、一度参加した経験があるのか、数回あるのか、あるいは継続的に参加しているのかといった具体的な回答から、候補者のDAOへの関与の深さやコミットメントが分かります。これにより、最適なDAOへのマッチングと、組織内での役割や責任を評価する手がかりとなります。",
    option: [
      OptionModel(
          optionId: "A",
          option: "参加経験なし",
          detail: "・DAOへの参加経験は、ない\n",
          nextNumber: 14),
      OptionModel(
          optionId: "B",
          option: "1回参加経験がある",
          detail: "・DAOへの参加経験は、ある。",
          nextNumber: 10),
      OptionModel(
          optionId: "C",
          option: "数回の参加経験が有る",
          detail: "・DAOへの参加経験は、数回ある。",
          nextNumber: 10),
      OptionModel(
          optionId: "D",
          option: "継続的に参加している",
          detail: "・DAOへの参加経験は、継続的にある。",
          nextNumber: 10),
    ],
    color: Colors.yellow,
  ),
  DAOQuestionModel(
    id: 10,
    title: "分散型意思決定への参加経験",
    question: "意思決定プロセスへの関与",
    question2: "BとCを経験したことがある場合は、Cを選択してください、全て経験が有るのであればDを選択してください",
    detail:
        "メンバーが分散型意思決定にどれだけ深く参加してきたかを理解するためのものです。投票、提案の作成、ガバナンスの設計、リーダーシップ経験などの要素について質問することで、メンバーの実際の経験とスキルを把握します。これにより、候補者がDAO内で主体的に行動し、コミュニティ内での貢献度がどれほど高いかを判断できます。経験がない場合は、「経験がない」という選択肢を通じて、メンバーの透明性と正直さを促進し、マッチングのプロセスをより効果的に進めることができます。",
    option: [
      OptionModel(
          optionId: "A",
          option: "投票のみか、経験がない",
          detail: "意思決定プロセスへの関与は、あまりない\n",
          nextNumber: 14), //A
      OptionModel(
          optionId: "B",
          option: "投票や提案の作成に参加",
          detail: "意思決定プロセスへの関与は、投票や提案の作成をしたことがる。",
          nextNumber: 11),
      OptionModel(
          optionId: "C",
          option: "ガバナンス手法の設計",
          detail: "意思決定プロセスへの関与は、ガバナンス手法の設計をしたことがる。",
          nextNumber: 11),
      OptionModel(
          optionId: "D",
          option: "リーダーシップロールの遂行",
          detail: "意思決定プロセスへの関与は、リーダーシップロールの遂行をしたことがる。",
          nextNumber: 11),
    ],
    color: Colors.yellow,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 11,
    title: "分散型意思決定への参加経験",
    question: "提案の起案やサポート経験",
    question2: "一番経験豊富なものを一つ選択してください",
    detail:
        "メンバーが分散型意思決定に積極的に参加し、提案の作成や議論に貢献してきたかどうかを評価するためのものです。候補者が提案を起草し、議論をサポートする経験は、リーダーシップとコミュニケーションのスキルを示す重要な指標です。質問の目的は、メンバーがプロセスにどれだけ積極的に関与しているかを把握し、DAO内での貢献度や影響力を評価することです。経験がない場合は、「経験がない」と正直に回答することで、候補者の透明性と誠実さが促進され、適切な役割やプロジェクトへのマッチングが可能となります。",
    option: [
      OptionModel(
          optionId: "A",
          option: "経験がない",
          detail: "提案の起案やサポート経験は、ない\n",
          nextNumber: 14),
      OptionModel(
          optionId: "B",
          option: "新しい提案の作成",
          detail: "提案の起案やサポート経験は、ある程度ある。",
          nextNumber: 12),
      OptionModel(
          optionId: "C",
          option: "他の提案やアイディアのサポート",
          detail: "提案の起案やサポート経験は、ありたの提案のサポートもした事がある。",
          nextNumber: 12),
      OptionModel(
          optionId: "D",
          option: "議論やディベートへの参加",
          detail: "提案の起案やサポート経験もあり、ディベートへの参加もある。",
          nextNumber: 12),
    ],
    color: Colors.yellow,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 12,
    title: "分散型意思決定への参加経験",
    question: "コミュニティへの貢献",
    question2: "一番経験豊富なものを一つ選択してください",
    detail:
        "メンバーが分散型意思決定においてコミュニティにどれほど貢献しているかを理解するためのものです。コミュニティへの貢献は、提案の共有、議論への参加、他のメンバーのサポートなど、様々な形で現れる可能性があります。この質問を通じて、候補者が協力的でコミュニケーション能力が高いかどうか、そしてDAOの目標や価値観に共感しているかどうかを評価します。経験がない場合は、「経験がない」という選択肢を通じて、候補者の正直な姿勢を尊重し、適切な役割への配置をサポートします。",
    option: [
      OptionModel(
          optionId: "A",
          option: "経験がない",
          detail: "コミュニティへの貢献の経験がない\n",
          nextNumber: 14),
      OptionModel(
          optionId: "B",
          option: "コミュニティの成長に貢献",
          detail: "コミュニティへの貢献は、ある。",
          nextNumber: 13),
      OptionModel(
          optionId: "C",
          option: "新たなメンバーの導入やサポート",
          detail: "コミュニティへの貢献は、新たなメンバーの導入やサポートの経験がある。",
          nextNumber: 13),
      OptionModel(
          optionId: "D",
          option: "イニシアチブの立案",
          detail: "コミュニティへの貢献は、イニシアチブの立案の経験がある。",
          nextNumber: 13),
    ],
    color: Colors.yellow,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 13,
    title: "分散型意思決定への参加経験",
    question: "ガバナンスプロセスへの参加経験",
    question2: "一番経験豊富なものを一つ選択してください",
    detail:
        "メンバーが分散型意思決定におけるガバナンスプロセスにどれほど深く関与しているかを把握するためのものです。ガバナンスプロセスへの参加は、ルールの制定、決定プロセスの改善提案、トークンホルダーの投票に参加などを含みます。この質問を通じて、候補者が分散型組織のルールとプロセスに理解を持ち、積極的に関与しているかどうかを評価します。経験がある場合、具体的な例やその経験から得た洞察を尋ねることで、彼らのガバナンスへの寄与度を詳細に把握します。一方で、経験がない場合は、「経験がない」という回答を通じて、候補者の透明性と正直さを尊重し、今後の学習や成長に対する開かれた態度を確認します。",
    option: [
      OptionModel(
          optionId: "A",
          option: "経験がない",
          detail: "ガバナンスプロセスへの参加経験は、ない\n",
          nextNumber: 14),
      OptionModel(
          optionId: "B",
          option: "ルール規制の策定",
          detail: "ガバナンスプロセスへの参加経験は、ルール規制の策定の経験がある\n",
          nextNumber: 14),
      OptionModel(
          optionId: "C",
          option: "決定プロセスの改善",
          detail: "ガバナンスプロセスへの参加経験は、決定プロセスの改善の経験がある\n",
          nextNumber: 14),
      OptionModel(
          optionId: "D",
          option: "トークンホルダーやメンバーの投票に参加",
          detail: "ガバナンスプロセスへの参加経験は、トークンホルダーやメンバーの投票に参加の経験がある\n",
          nextNumber: 14),
    ],
    color: Colors.yellow,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 14,
    title: "リーダーシップとコミュニティブルディング",
    question: "リーダーシップ経験",
    question2: "一番経験豊富なものを一つ選択してください",
    detail:
        "メンバーが分散型自治組織（DAO）においてどれだけリーダーシップを発揮しているかを理解するためのものです。リーダーシップ経験がある場合、具体的なプロジェクトやイニシアティブでのリーダーシップの役割、成果、チームの指導について尋ねることで、候補者の影響力や能力を深堀りします。リーダーシップがない場合も、「経験がない」という回答を通じて、正直な姿勢を尊重し、候補者の成長や学習の可能性に対する態度を評価します。この質問は、コミュニティビルディングにおいてリーダーシップの存在が、DAOの成功に寄与するかどうかを判断する手がかりを提供します。",
    option: [
      OptionModel(
          optionId: "A",
          option: "経験がない",
          detail: "・リーダーシップ経験がない\n",
          nextNumber: 16),
      OptionModel(
          optionId: "B",
          option: "新しいイニシアティブの主導経験",
          detail: "・リーダーシップ経験は、新しいイニシアティブの主導経験がある。",
          nextNumber: 15),
      OptionModel(
          optionId: "C",
          option: "チームやプロジェクトのリーダーシップ経験がある",
          detail: "・リーダーシップ経験は、チームやプロジェクトのリーダーシップ経験がある。",
          nextNumber: 15),
    ],
    color: Colors.blue,
  ),
  DAOQuestionModel(
    id: 15,
    title: "リーダーシップとコミュニティブルディング",
    question: "チームメンバーのモチベーション向上に取り組む際、どのアプローチが最も近いですか？",
    question2: "リーダーシップ経験についてのプラスの質問です",
    detail:
        """リーダーシップスタイルの理解: 候補者が指導的な役割を果たす際にどのようなアプローチを取るかを知ることで、彼らのリーダーシップスタイルを理解します。
コミュニティビルディングの視点: チームメンバーのモチベーション向上に焦点を当て、コミュニティ全体の健全性を向上させる取り組みにどれほど意識的に取り組んでいるかを確認します。
問題解決能力と柔軟性: 状況に応じて異なるアプローチを取る柔軟性や、モチベーション向上に関連する問題に対する洞察を評価します。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "個々の強みを理解し、成功を共有することでモチベーションを高めます。",
          detail: "さらにリーダーシップとコミュニティブルディングへの理解もある程度ある\n",
          nextNumber: 16), //A
      OptionModel(
          optionId: "B",
          option: "私が与えたタスクが成功することでモチベーションが向上します。",
          detail: "しかし、リーダーシップとコミュニティブルディングへの理解は、ない\n",
          nextNumber: 16),
      OptionModel(
          optionId: "C",
          option: "メンバーのモチベーションにはあまり関与しない方が良いと考えます。",
          detail: "しかし、リーダーシップとコミュニティブルディングへの理解は、ない\n",
          nextNumber: 16),
      OptionModel(
          optionId: "D",
          option: "チームメンバーのモチベーション向上はあまり重要ではないと考えます。",
          detail: "しかし、リーダーシップとコミュニティブルディングへの理解は、ない\n",
          nextNumber: 16),
    ],
    color: Colors.blue,
    quiz: true,
  ),
  DAOQuestionModel(
    id: 16,
    title: "リーダーシップとコミュニティブルディング",
    question: "コミュニティビルディング",
    question2: "一番経験豊富なものを一つ選択してください",
    detail:
        """コミュニケーションスキルの評価: コミュニティビルディングには優れたコミュニケーションスキルが不可欠です。候補者がどれだけ効果的なコミュニケーションを取れるかを把握します。
協力と協調の重視: コミュニティビルディングは協力と協調が鍵となります。候補者がメンバーとの協力や協調をどれほど促進しているかを確認します。
リーダーシップの体現: コミュニティビルディングはリーダーシップの一環でもあります。候補者が主体的に行動し、コミュニティの結束を高めるためにどのような取り組みを行っているかを知ります。
経験がない場合、「コミュニティビルディングに特に関与していない」と回答することは、候補者の率直さを尊重し、今後の成長や学習に対する態度を確認する重要な要素となります。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "コミュニティの形成や成長に積極的に参加",
          detail: "コミュニティの形成や成長に積極的に参加経験があります。\n",
          nextNumber: 17),
      OptionModel(
          optionId: "B",
          option: "新メンバーの導入のサポート",
          detail: "新メンバーの導入のサポート経験があります。\n",
          nextNumber: 17),
      OptionModel(
          optionId: "C",
          option: "コミュニティビルディングに特に関与していない",
          detail: "コミュニティビルディングに特に関与した事がありません。\n",
          nextNumber: 17),
    ],
    color: Colors.blue,
  ),
  DAOQuestionModel(
    id: 17,
    title: "リーダーシップとコミュニティブルディング",
    question: "ビジョンと目標設定",
    question2: "一番経験豊富なものを一つ選択してください",
    detail:
        """分散型自治組織（DAO）においてグループやコミュニティに方向性を提供し、共有のビジョンや明確な目標を設定するためにどれだけ関与しているかを理解するためのものです。
戦略的思考と計画: 候補者がビジョンと目標を設定するプロセスにどれだけ戦略的思考を持っているかを把握します。
コミュニティの結束: 共有されたビジョンや目標は、コミュニティの結束を高める重要な要素です。候補者がそれを実現するための努力をしているかを確認します。
リーダーシップと影響力: ビジョンと目標の設定はリーダーシップの一環であり、候補者がコミュニティに対してどのような影響を持っているかを見極めます。
経験がない場合、「ビジョン設定や目標達成に特に関与していない」と回答することで、候補者の正直さを尊重し、今後の学習や成長に対する開かれた態度を確認します。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "グループやコミュニティのビジョンや目標の設定や推進に貢献",
          detail: "・グループやコミュニティのビジョンや目標の設定や推進に貢献の経験があります。\n",
          nextNumber: 18),
      OptionModel(
          optionId: "B",
          option: "新しいアイデアや目標の提案経験がある",
          detail: "・新しいアイデアや目標の提案の経験があります。\n",
          nextNumber: 18),
      OptionModel(
          optionId: "C",
          option: "ビジョン設定や目標達成に特に関与していない",
          detail: "・ビジョン設定や目標達成に特に関与していません\n",
          nextNumber: 18),
    ],
    color: Colors.blue,
  ),
  DAOQuestionModel(
    id: 18,
    title: "リーダーシップとコミュニティブルディング",
    question: "メンバーへのサポート",
    question2: "一番経験豊富なものを一つ選択してください",
    detail: """
リーダーシップの一環として他のメンバーやチームの成長をサポートしているかどうかを理解するためのものです。
協力と共感: メンバーへのサポートは、協力と共感の表れです。候補者が他のメンバーと協力し、彼らのニーズや課題に共感しているかを評価します。
リーダーシップの姿勢: チームメンバーへのサポートは、リーダーシップの一環と見なされます。候補者がリーダーシップの役割を果たし、他のメンバーをサポートする姿勢を確認します。
成長の促進: メンバーへのサポートが成長を促進する重要な手段であるため、候補者がコミュニティ全体の発展にどれほど貢献しているかを見極めます。
経験がない場合、「メンバーのサポートに特に関与していない」と正直に回答することは、候補者の率直さを尊重し、今後の学習や成長に対する態度を確認します。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "メンバーのニーズに応じたサポート提供経験",
          detail: "・メンバーのニーズに応じたサポート提供経験があります\n",
          nextNumber: 19),
      OptionModel(
          optionId: "B",
          option: "チームやコミュニティメンバーの成長をサポート",
          detail: "・チームやコミュニティメンバーの成長をサポート経験は、あります\n",
          nextNumber: 19),
      OptionModel(
          optionId: "C",
          option: "メンバーのサポートに特に関与していない",
          detail: "・メンバーのサポートに特に関与した事がありません\n",
          nextNumber: 19),
    ],
    color: Colors.blue,
  ),
  DAOQuestionModel(
    id: 19,
    title: "リーダーシップとコミュニティブルディング",
    question: "協調性と調整能力",
    question2: "一番経験豊富なものを一つ選択してください",
    detail: """候補者がチームやコミュニティ内での協力や調整にどれだけ積極的に関与しているかを理解するためのものです。
コミュニケーションと協力: 候補者がメンバーとのコミュニケーションや協力にどれだけ重点を置いているかを評価します。
調整とコンフリクトの解決: チーム内での異なる意見やコンフリクトが発生した際に、候補者がどのように調整し、解決に向けて努力しているかを把握します。
協調的なリーダーシップ: 候補者が協調的であり、コミュニティ全体の協力調和を促進するリーダーシップの実践があるかどうかを見極めます。
経験がない場合は、「特に関与していない」と正直に回答することで、候補者の率直さを尊重し、今後の成長や学習に向けた意欲を確認します。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "意見の調整やコンフリクトの解決に積極的に関与",
          detail: "・意見の調整やコンフリクトの解決に積極的に関与の経験は、あります\n",
          nextNumber: 20),
      OptionModel(
          optionId: "B",
          option: "チームの協力や調和を促進",
          detail: "・チームの協力や調和を促進の経験はあります\n",
          nextNumber: 20),
      OptionModel(
          optionId: "C",
          option: "特に関与をしていない",
          detail: "・協調性と調整能力に関して特に関与をした事がありません\n",
          nextNumber: 20),
    ],
    color: Colors.blue,
  ),
  DAOQuestionModel(
    id: 20,
    title: "DAOとミッションや価値観への適合",
    question: "DAOのミッションへの共感であなたの考えに当てはまるものを選択してください",
    question2: "一番当てはまるものを一つ選択してください",
    detail: """DAOのミッションや価値観にどれだけ共感し、それに対してどのような理解を持っているかを評価するためのものです。
コアバリューの共有: 候補者がDAOが掲げるミッションや価値観に共感しているかどうかを確認します。
組織への適応性: 候補者がDAOの目的や方針に対してどれだけ適応し、組織に適応できるかを評価します。
ミッションへの理解: DAOが持つミッションが候補者にとって理解可能であり、それに対してどれほど深い理解があるかを見極めます。
理解がない場合、「ミッションや目的に対する理解がない」と正直に回答することで、候補者の透明性を尊重し、今後の学習や理解のための機会を確認します""",
    option: [
      OptionModel(
          optionId: "A",
          option: "DAOのミッションや目的に強く共感している",
          detail: "・DAOのミッションや目的に強く共感している\n",
          nextNumber: 21),
      OptionModel(
          optionId: "B",
          option: "ミッションに理解があるが、共感はしていない",
          detail: "・DAOのミッションに理解があるが、共感はしていない\n",
          nextNumber: 21),
      OptionModel(
          optionId: "C",
          option: "ミッションや目的に対する理解がない",
          detail: "・DAOのミッションや目的に対する理解がない\n",
          nextNumber: 21),
      OptionModel(
          optionId: "D",
          option: "わからない",
          detail: "・DAOのミッションや目的に関しては、よくわかっていない\n",
          nextNumber: 21),
    ],
    color: Colors.pink,
  ),
  DAOQuestionModel(
    id: 21,
    title: "DAOとミッションや価値観への適合",
    question: "DAOの価値観への適合であなたの考えに当てはまるものを選択してください",
    question2: "一番当てはまるものを一つ選択してください",
    detail: """分散型自治組織（DAO）が掲げる価値観に共感し、それに基づいた行動や意見を持っているかを評価するためのものです。
組織文化との調和: 候補者がDAOの価値観とどれだけ調和し、組織文化に適応できるかを確認します。
コミュニティへの適合: DAOが築くコミュニティやメンバーとの相性がどれほど良いかを理解します。
価値観への理解: 候補者がDAOが追求する価値観に対してどれほど理解を示し、それに賛同しているかを見極めます。
理解がない場合、「わからない」と回答することで、候補者の率直さを尊重し、今後の学習や価値観の理解に向けた意欲を確認します。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "DAOの掲げる価値観に一貫して適合している",
          detail: "・DAOの掲げる価値観に一貫して適合していると考える\n",
          nextNumber: 22),
      OptionModel(
          optionId: "B",
          option: "価値観には、一部適合しているが、全てに適合していない",
          detail: "・価値観には、一部適合しているが、全てに適合していないと考える\n",
          nextNumber: 22),
      OptionModel(
          optionId: "C",
          option: "DAOの価値観とは、合わない",
          detail: "・DAOの価値観とは、合わないと考える\n",
          nextNumber: 22),
      OptionModel(
          optionId: "D",
          option: "わからない",
          detail: "・DAOの価値観との適合に関しては、よくわかっていない\n",
          nextNumber: 22),
    ],
    color: Colors.pink,
  ),
  DAOQuestionModel(
    id: 22,
    title: "DAOとミッションや価値観への適合",
    question: "貢献や影響の目的についてあなたの考えに当てはまるものを選択してください",
    question2: "一番当てはまるものを一つ選択してください",
    detail: """分散型自治組織（DAO）においてどのように貢献し、影響を与えることを目指しているかを理解するためのものです。
個人の目的と組織の目的の調和: 候補者が自身の目的や目標とDAOのミッション・価値観がどれだけ調和しているかを評価します。
貢献へのコミットメント: 候補者がDAOに対してどれだけ真剣に貢献し、影響を与えることにコミットしているかを確認します。
影響を通じた成果: 候補者がどのような方法で貢献し、それを通じてどのような影響や成果を期待しているかを理解します。
理解がない場合は、「わからない」と回答することで、候補者の正直さを尊重し、今後の学習や理解のための機会を確認します。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "DAOに貢献し、その影響を高めることを重要視している",
          detail: "・DAOに貢献し、その影響を高めることを重要視している\n",
          nextNumber: 23),
      OptionModel(
          optionId: "B",
          option: "貢献や影響に意識しているが、その目的には重点を置いていない",
          detail: "・DAOとミッションへ貢献や影響に意識しているが、その目的には重点を置いていない\n",
          nextNumber: 23),
      OptionModel(
          optionId: "C",
          option: "DAOへの貢献や影響に対する意識が薄い",
          detail: "・DAOとミッションへの貢献や影響に対する意識が薄い\n",
          nextNumber: 23),
      OptionModel(
          optionId: "D",
          option: "わからない",
          detail: "・DAOとミッションへの貢献や影響に関しては、よくわかっていない\n",
          nextNumber: 23),
    ],
    color: Colors.pink,
  ),
  DAOQuestionModel(
    id: 23,
    title: "DAOとミッションや価値観への適合",
    question: "DAOの方針や決定への共感についてあなたの考えに当てはまるものを選択してください",
    question2: "一番当てはまるものを一つ選択してください",
    detail: """分散型自治組織（DAO）の意思決定プロセスや方針に対してどれだけ共感し、それをどれほど支持しているかを理解するためのものです。
組織の方針への適応: 候補者がDAOの方針や決定に対してどれだけ適応し、それを支持しているかを確認します。
組織全体への共感: DAOの方針がメンバー全体に対して意義があり、共感を呼び起こすかどうかを理解します。
組織の決定プロセスへの理解: 候補者がDAOの決定プロセスに理解を示し、それが透明で効果的であると感じているかを評価します。
理解がない場合は、「わからない」と回答することで、候補者の率直さを尊重し、今後の学習や理解のための機会を確認します。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "DAOの決定や方針に強く共感し、支持する",
          detail: "・DAOの決定や方針に強く共感し、基本的には支持する\n",
          nextNumber: 24),
      OptionModel(
          optionId: "B",
          option: "多くの方針や決定には同意するが、全てに同意しているわけではない",
          detail: "・DAOの決定や方針に多くの方針や決定には同意するが、全てに同意しているわけではない\n",
          nextNumber: 24),
      OptionModel(
          optionId: "C",
          option: "DAOの方針や決定には賛同していない",
          detail: "・DAOの方針や決定には賛同していない\n",
          nextNumber: 24),
      OptionModel(
          optionId: "D",
          option: "わからない",
          detail: "・DAOの方針や決定に関してよくわかっていない\n",
          nextNumber: 24),
    ],
    color: Colors.pink,
  ),
  DAOQuestionModel(
    id: 24,
    title: "DAOとミッションや価値観への適合",
    question: "自らの目的とDAOの目的に一致についてあなたの考えに当てはまるものを選択してください",
    question2: "一番当てはまるものを一つ選択してください",
    detail: """候補者が自身の目的や志向が分散型自治組織（DAO）のミッションや価値観とどれだけ一致しているかを評価するためのものです。
個人の志向とDAOの目的の合致: 候補者が自身の目的や志向がDAOが追求するミッションや価値観とどれだけ一致しているかを確認します。
組織との調和: 候補者がDAOにおいて自分の目的を追求するためにどれだけ組織と協力し、調和を図れるかを理解します。
目的達成へのコミットメント: 候補者がDAOの目的を達成するためにどれだけコミットしているかを評価します。
理解がない場合は、「わからない」と回答することで、候補者の率直さを尊重し、今後の学習や理解のための機会を確認します。""",
    option: [
      OptionModel(
          optionId: "A",
          option: "自らの目的やDAOのミッションと一致している",
          detail: "・自らの目的やDAOのミッションと一致していると考える\n",
          nextNumber: 25),
      OptionModel(
          optionId: "B",
          option: "一部自身の目的がDAOと一致しているが、完全に一致していない",
          detail: "・一部自身の目的がDAOと一致しているが、完全に一致していないと考える\n",
          nextNumber: 25),
      OptionModel(
          optionId: "C",
          option: "自らの目的やDAOのミッションには、一切一致していない",
          detail: "・自らの目的やDAOのミッションには、一切一致していないと考える\n",
          nextNumber: 25),
      OptionModel(
          optionId: "D",
          option: "わからない",
          detail: "・自らの目的やDAOのミッションに関しては、よくわかっていない\n",
          nextNumber: 25),
    ],
    color: Colors.pink,
  ),
];
