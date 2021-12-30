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
  double fontSize = 85.0;
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
    adjustDisplayNum();
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
      else if(currentNum.split('.').join('').length < 9){
        currentNum += n;
      }
    }
    displayNum = currentNum;
    adjustDisplayNum();
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
    adjustDisplayNum();
    clearButtonColor();
    notifyListeners();
  }

  void clear(){
    displayNum = '0';
    adjustDisplayNum();
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
    displayNum = displayNum.split(',').join('');
    if(displayNum != '0'){
      if(displayNum == result){
        displayNum = (Decimal.parse(displayNum) * Decimal.parse('-1')).toString();
        result = displayNum;
      }
      else if(displayNum == tmpResult){
        displayNum = (Decimal.parse(displayNum) * Decimal.parse('-1')).toString();
        tmpResult = displayNum;
      }
      else{
        displayNum = (Decimal.parse(displayNum) * Decimal.parse('-1')).toString();
        currentNum = displayNum;
      }
    }
    adjustDisplayNum();
    notifyListeners();
  }

  void convertToPercentile(){
    displayNum = displayNum.split(',').join('');
    if(displayNum != '0'){
      if(displayNum == result){
        displayNum = (Decimal.parse(displayNum) * Decimal.parse('0.01')).toString();
        result = displayNum;
      }
      else if(displayNum == tmpResult){
        displayNum = (Decimal.parse(displayNum) * Decimal.parse('0.01')).toString();
        tmpResult = displayNum;
      }
      else{
        displayNum = (Decimal.parse(displayNum) * Decimal.parse('0.01')).toString();
        currentNum = displayNum;
      }
    }
    adjustDisplayNum();
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

  void adjustDisplayNum(){
    if (displayNum != '表示できない🥺') {
      var isMinus = displayNum.contains('-');
      var tmpNum = displayNum.replaceAll('-', '').replaceAll(',', '');
      var numBuf = tmpNum.split('.');
      var displayNumLen = tmpNum
          .replaceAll('.', '')
          .length;
      if(displayNumLen > 9 && numBuf.length == 2 && numBuf[0].length < 9){
        var extraLen = 9 - numBuf[0].length;
        var baseNum = pow(10, extraLen);
        displayNum = ((Decimal.parse(baseNum.toString()) * Decimal.parse(tmpNum.toString())).round() / Decimal.parse(baseNum.toString())).toDouble().toString();
        if(isMinus){
          displayNum = '-' + displayNum;
        }
        numBuf = displayNum.split('.');
        if(numBuf.length == 2 && numBuf[1] == '0'){
          displayNum = numBuf[0];
          numBuf = displayNum.split('.');
        }
      }
      var numInt = numBuf[0];
      if (numInt.length >= 4) {
        displayNum = '';
        var len = numInt.length;
        for (int i = 0; i < len; i++) {
          if (i != 0 && (i + 1) % 3 == 1) {
            displayNum = ',' + displayNum;
          }
          displayNum = numInt[len - i - 1] + displayNum;
        }
        if (numBuf.length == 2) {
          displayNum = displayNum + '.' + numBuf[1];
        }
        if(isMinus){
          displayNum = '-'+displayNum;
        }
      }

      displayNumLen = displayNum.replaceAll('-', '').replaceAll(',', '').replaceAll('.', '').length;
      if (displayNumLen <= 6) {
        fontSize = 85.0;
      }
      else if (displayNumLen == 7) {
        fontSize = 80.0;
      }
      else if (displayNumLen == 8) {
        fontSize = 70.0;
      }
      else if (displayNumLen == 9 && !isMinus) {
        fontSize = 65.0;
      }
      else if(displayNumLen == 9 && isMinus){
        fontSize = 60.0;
      }
      else {
        displayNum = '表示できない🥺';
        fontSize = 40.0;
      }
    }
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