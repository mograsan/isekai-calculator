import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class FormulaController with ChangeNotifier {
  String formula = '0';
  String currentChar = '0';
  Parser parser = Parser();
  bool usedOperator = false;
  ContextModel context = ContextModel();
  Color plusButtonColor = Colors.orange;
  Color plusButtonFontColor = Colors.white;
  Color minusButtonColor = Colors.orange;
  Color minusButtonFontColor = Colors.white;
  Color multipleButtonColor = Colors.orange;
  Color multipleButtonFontColor = Colors.white;
  Color divideButtonColor = Colors.orange;
  Color divideButtonFontColor = Colors.white;
  int digit = 0;

  void addNumber(String n) {
    clearButtonColor();
    int numLen = currentChar.length;
    if(usedOperator){
      currentChar = '0';
      usedOperator = false;
    }
    if(n == '.'){
      if(currentChar[numLen-1] != '.'){
        currentChar += n;
        formula += n;
      }
    }
    else{
      if(currentChar == '0' || currentChar == 'エラー'){
        currentChar = n;
      }
      else{
        currentChar += n;
      }
      if(formula == '0'){
        formula = n;
      }
      else{
        formula += n;
      }
    }
    notifyListeners();
  }

  void addOperator(String op){
    clearButtonColor();
    if(currentChar != 'エラー') {
      if (usedOperator) {
        final formulaLen = formula.length - 1;
        formula = formula.substring(0, formulaLen);
      }
      switch (op) {
        case '+':
          plusButtonColor = Colors.white;
          plusButtonFontColor = Colors.orange;
          calculate();
          break;
        case '-':
          minusButtonColor = Colors.white;
          minusButtonFontColor = Colors.orange;
          calculate();
          break;
        case '*':
          multipleButtonColor = Colors.white;
          multipleButtonFontColor = Colors.orange;
          break;
        case '/':
          divideButtonColor = Colors.white;
          divideButtonFontColor = Colors.orange;
          break;
      }
      formula += op;
      usedOperator = true;
    }
    notifyListeners();
  }

  void allClear(){
    formula = '0';
    currentChar = '0';
    digit = 0;
    clearButtonColor();
    notifyListeners();
  }

  void clear(){
    int numLen = currentChar.length;
    int formulaLen = formula.length;
    formula = formula.substring(0, formulaLen - numLen);
    currentChar = '0';
    notifyListeners();
  }

  void changeCode(){
    if(!usedOperator){
      int numLen = currentChar.length;
      if(double.parse(currentChar) >= 0){
        currentChar = '-' + currentChar;
      }
      else{
        currentChar = currentChar.substring(1, numLen);
      }
      int formulaLen = formula.length;
      formula = formula.substring(0, formulaLen - numLen) + currentChar;
    }
    notifyListeners();
  }

  void convertToPercentile(){
    if(!usedOperator && currentChar != '0'){
      int numLen = currentChar.length;
      currentChar = (double.parse(currentChar) * 0.01).toString();
      int formulaLen = formula.length;
      formula = formula.substring(0, formulaLen - numLen) + currentChar;
    }
    notifyListeners();
  }

  void clearButtonColor(){
    plusButtonColor = Colors.orange;
    plusButtonFontColor = Colors.white;
    minusButtonColor = Colors.orange;
    minusButtonFontColor = Colors.white;
    multipleButtonColor = Colors.orange;
    multipleButtonFontColor = Colors.white;
    divideButtonColor = Colors.orange;
    divideButtonFontColor = Colors.white;
  }

  void calculate(){
    if(currentChar != 'エラー') {
      Expression exp = parser.parse(formula);
      var ans = exp.evaluate(EvaluationType.REAL, context);
      formula = ans.toString();
      currentChar = ans.toString();
      formula = currentChar;
      if (ans - ans.round() == 0.0) {
        currentChar = ans.round().toString();
        if (currentChar.length > 7) {
          currentChar = 'エラー';
          formula = '0';
        }
      }
    }
    notifyListeners();
  }
}