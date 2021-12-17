import 'dart:ffi';
import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class FormulaController with ChangeNotifier {
  String currentNum = '';
  String displayNum = '0';
  String result = '0';
  String tmpResult = '0';
  String plusOrSubOp = '';
  String multiOrDivOp = '';
  String lastOp = '';
  String recentOp = '';
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

  void applyOperator(String op){
    lastOp = op;
    recentOp = lastOp;
    changeButtonColor(op);
    if(op == '+' || op == '-') {
      if (plusOrSubOp != '' && multiOrDivOp != '') {
        var tmp = calculate(tmpResult, currentNum, multiOrDivOp);
        displayNum = calculate(result, tmp, plusOrSubOp);
      }
      else if (plusOrSubOp != '') {
        displayNum = calculate(result, currentNum, plusOrSubOp);
      }
      else if (multiOrDivOp != '') {
        displayNum = calculate(result, currentNum, multiOrDivOp);
      }
    }
    else if(op == '*' || op == '/') {
      if (plusOrSubOp != '' && multiOrDivOp != '') {
        displayNum = calculate(tmpResult, currentNum, multiOrDivOp);
      }
      else if (plusOrSubOp != '') {
        displayNum = currentNum;
      }
      else if (multiOrDivOp != '') {
        displayNum = calculate(result, currentNum, multiOrDivOp);
      }
    }
    else if(op == '='){
      if (multiOrDivOp == '' && plusOrSubOp == '') {
        if (currentNum != '') {
          result = currentNum;
        }
      }
      else if (multiOrDivOp != '' && plusOrSubOp != '') {
        tmpResult = calculate(tmpResult, currentNum, multiOrDivOp);
        result = calculate(result, tmpResult, plusOrSubOp);
      }
      else if (multiOrDivOp != '') {
        result = calculate(result, currentNum, multiOrDivOp);
      }
      else {
        result = calculate(result, currentNum, plusOrSubOp);
      }
      plusOrSubOp = '';
      multiOrDivOp = '';
      tmpResult = '0';
      currentNum = '';
      lastOp = '';
      recentOp = '';
      displayNum = result;
    }
    notifyListeners();
  }

  String calculate(String num1, String num2, String op){
    switch(op){
      case '+':
        return (Decimal.parse(num1) + Decimal.parse(num2)).toString();
      case '-':
        return (Decimal.parse(num1) - Decimal.parse(num2)).toString();
      case '*':
        return (Decimal.parse(num1) * Decimal.parse(num2)).toString();
      case '/':
        var ans = (Decimal.parse(num1) / Decimal.parse(num2)).toString();
        if(ans.contains('/')){
          ans = (Decimal.parse(num1) / Decimal.parse(num2)).toDouble().toString();
        }
        return ans;
    }
    return '';
  }

  void addNumber(String n) {
    clearButtonColor();
    if(lastOp != ''){
      if(plusOrSubOp != '' && multiOrDivOp != ''){
        tmpResult = calculate(tmpResult, currentNum, multiOrDivOp);
        multiOrDivOp = '';
        if(lastOp == '+' || lastOp == '-'){
          result = calculate(result, tmpResult, plusOrSubOp);
          plusOrSubOp = lastOp;
        }
        else{
          multiOrDivOp = lastOp;
        }
      }
      else if(plusOrSubOp != ''){
        if(lastOp == '+' || lastOp == '-'){
          result = calculate(result, currentNum, plusOrSubOp);
          plusOrSubOp = lastOp;
        }
        else{
          tmpResult = currentNum;
          multiOrDivOp = lastOp;
        }
      }
      else if(multiOrDivOp != ''){
        result = calculate(result, currentNum, multiOrDivOp);
        multiOrDivOp = '';
        if(lastOp == '+' || lastOp == '-'){
          plusOrSubOp = lastOp;
        }
        else{
          multiOrDivOp = lastOp;
        }
      }
      else{
        if(currentNum != ''){
          result = currentNum;
        }
        if(lastOp == '+' || lastOp == '-'){
          plusOrSubOp = lastOp;
        }
        else{
          multiOrDivOp = lastOp;
        }
      }
      lastOp = '';
      currentNum = '';
    }
    if(currentNum == '0'){
      if(n == '.'){
        currentNum = '0.';
      }
      else{
        currentNum = n;
      }
    }
    else if(n == '.' && !currentNum.contains('.') || n != '.'){
      if(currentNum == '' && n == '.'){
        currentNum = '0.';
      }
      else{
        currentNum += n;
      }
    }
    displayNum = currentNum;
    notifyListeners();
  }

  void allClear(){
    result = '0';
    tmpResult = '0';
    displayNum = '0';
    currentNum = '';
    plusOrSubOp = '';
    multiOrDivOp = '';
    lastOp = '';
    recentOp = '';
    digit = 0;
    clearButtonColor();
    notifyListeners();
  }

  void clear(){
    displayNum = '0';
    currentNum = '';
    if(lastOp == '' && recentOp != ''){
      lastOp = recentOp;
    }
    changeButtonColor(lastOp);
    if(lastOp == '+' || lastOp == '-'){
      plusOrSubOp = '';
    }
    else if(lastOp == '*' || lastOp == '/'){
      multiOrDivOp = '';
    }
    notifyListeners();
  }

  void changeCode(){
    int numLen = displayNum.length;
    if(double.parse(displayNum) >= 0){
      displayNum = '-' + displayNum;
    }
    else{
      displayNum = displayNum.substring(1, numLen);
    }
    notifyListeners();
  }

  void convertToPercentile(){
    if(displayNum != '0'){
      displayNum = (Decimal.parse(displayNum) * Decimal.parse('0.01')).toString();
      if(displayNum == result){
        result = displayNum;
      }
      else if(displayNum == tmpResult){
        tmpResult = displayNum;
      }
      else{
        currentNum = displayNum;
      }
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
    notifyListeners();
  }

  void changeButtonColor(String op){
    clearButtonColor();
    switch(op){
      case '+':
        plusButtonColor = Colors.white;
        plusButtonFontColor = Colors.orange;
        break;
      case '-':
        minusButtonColor = Colors.white;
        minusButtonFontColor = Colors.orange;
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
  }

}