import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'formula_controller.dart';

String formula = '0';
var outputState = _OutputState();

class Output extends StatefulWidget {
  const Output({Key? key}) : super(key: key);

  @override
  _OutputState createState() => _OutputState();
}

class _OutputState extends State<Output> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }


  @override
  Widget build(BuildContext context) {
    final currentChar = context.select((FormulaController controller) => controller.displayNum);
    final fontSize = context.select((FormulaController controller) => controller.fontSize);
    return ChangeNotifierProvider(
      create: (context) => FormulaController(),
      child: Container(
          height: 330,
          padding: const EdgeInsets.only(right: 25),
          decoration: const BoxDecoration(
              color: Colors.black
          ),
          child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                  currentChar,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Helvetica Neue',
                      color: Colors.white
                  )
              )
          )
      )
    );
  }
}