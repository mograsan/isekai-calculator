import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexController with ChangeNotifier {
  String formula = '0';
  String currentChar = '0';

  void addFormula(String f) {
    formula += f;
    notifyListeners();
  }

  void clear(){
    formula = '0';
  }
}