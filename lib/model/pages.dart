import 'package:flutter/material.dart';

class homePage extends ChangeNotifier {
  var index = 2;
  changeIndex(value) {
    index = value;
    notifyListeners();
  }
}
