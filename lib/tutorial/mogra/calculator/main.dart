import 'package:flutter/material.dart';
import 'keyboard.dart';
import 'output.dart';

void main() {
  runApp(const MyCalculator());
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "calculator",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Output(),
            Keyboard(),
            Container(
              height: 80,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}