import 'package:flutter/material.dart';
import 'package:isekai_calculator/tutorial/mogra/test/tile.dart';

class Talk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("トーク"),
        centerTitle: true,
        backgroundColor: Colors.black87,
        leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings)
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Tile(Icons.accessibility_outlined, "伊達偉志", "早く返事しろよ"),
          Tile(Icons.accessibility_outlined, "はちみつ次郎", "そろそろ引退しようかなと思ってる"),
          Tile(Icons.accessibility_outlined, "武田鉄矢", "僕は死にましぇん"),
          Tile(Icons.accessibility_outlined, "地獄少女", "引き摺り下ろしてやる！"),
          Tile(Icons.accessibility_outlined, "もっつぁれら", "今週の土曜にウルトラ博物館いかない？"),
          Tile(Icons.accessibility_outlined, "とほほ丸", "まじでとほほ..."),
          Tile(Icons.accessibility_outlined, "浜辺美波", "むふ💓"),
          Tile(Icons.accessibility_outlined, "マッスル竹田", "昔からお前ってそういうところあるよなー"),
          Tile(Icons.accessibility_outlined, "ステップ長谷川", "なんで急に帰ったん？"),
          Tile(Icons.accessibility_outlined, "新海誠", "次回作まじ悩む"),
          Tile(Icons.accessibility_outlined, "プリ プリ美", "まじで隣の奴臭いんだけど"),
          Tile(Icons.accessibility_outlined, "ぽみゅ", "キュリー夫人まじリスペクト"),
          Tile(Icons.accessibility_outlined, "くまだまさし", "あごひげ抜くのってクセになるよね"),
        ]
      ),
    );
  }
}
