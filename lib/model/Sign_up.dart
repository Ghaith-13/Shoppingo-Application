import 'package:flutter/material.dart';

// ignore: camel_case_types
class Sign_up_model extends ChangeNotifier {
  Icon eye = const Icon(
    Icons.visibility,
  );
  var press = true;
  Icon eye2 = const Icon(
    Icons.visibility,
  );
  var press2 = true;
  changeIcon() {
    if (press == true) {
      press = false;
      eye = const Icon(
        Icons.visibility_off,
      );
      notifyListeners();
    } else {
      press = true;
      eye = const Icon(
        Icons.visibility,
      );
      notifyListeners();
    }
  }

  changeIcon2() {
    if (press2 == true) {
      press2 = false;
      eye2 = const Icon(
        Icons.visibility_off,
      );
      notifyListeners();
    } else {
      press2 = true;
      eye2 = const Icon(
        Icons.visibility,
      );
      notifyListeners();
    }
  }
}
