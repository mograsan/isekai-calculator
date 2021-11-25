import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget { // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"), // <- (※2)
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
      body: const Center(child: Text("タイムラインだって言ってんだろボケ！！") // <- (※3)
      ),
    );
  }
}
