// 文章を作成する関数
String generateText(List<List> myAnswer) {
  // 2次元の配列をループして2番目の値を取得して文章を作成
  return myAnswer.map((personData) => '${personData[2]}').join('');
}
