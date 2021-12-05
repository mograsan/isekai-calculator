import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'formula_controller.dart';
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
      color: Colors.black,
      home: ChangeNotifierProvider(
        create: (context) => FormulaController(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Output(),
            Keyboard(),
            Expanded(
              // height: 80,
              child: Container(
                color: Colors.black,
              )
            )
          ],
        ),
      ),
    );
  }
}