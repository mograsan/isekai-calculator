import 'package:flutter/material.dart';
import 'header.dart'; // <- header.dart を インポート
import 'route.dart'; // <- header.dart を インポート

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sugoi App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
      ),
      home: const RootWidget(),
    );
  }
}