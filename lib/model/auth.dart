import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingo/pages.dart';
import 'dart:convert';

import '../auth/Log_in.dart';

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

  late SharedPreferences SharedStorage;

  Future<void> _initPrefs() async {
    SharedStorage = await SharedPreferences.getInstance();
  }

  var fullName, email, password;

  bool Showsnack = false;
  Future<void> fetchData(
      String fullName, String email, String password, context) async {
    print("yyyyy");
    final url =
        Uri.parse('https://shoppingo.onrender.com/api/v2.0/auth/signup');
    _initPrefs();
    try {
      final response = await http.post(
        url,
        body: {
          'fullName': fullName,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        // Signup successful
        print('Signup successful!');
        print(jsonDecode(response.body));
        // Store token in shared preferences
        String token = jsonDecode(response.body)['token'];
        String role = jsonDecode(response.body)['user']['role'];
        await SharedStorage.setString('token', token);
        await SharedStorage.setString('role', role);

        Showsnack = true;

        var Snack = SnackBar(content: Text("تم تسجيل الدخول بنجاح"));
        ScaffoldMessenger.of(context).showSnackBar(Snack);

        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(seconds: 1),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale: animation,
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return pages();
              },
            ));
      } else {
        // Signup failed
        print('Signup failed!');
        String msg = jsonDecode(response.body)['message'];

        var Snack = SnackBar(
            content: Container(
          child: Text(
            msg,
            style: TextStyle(color: Colors.red),
          ),
        ));
        ScaffoldMessenger.of(context).showSnackBar(Snack);
      }
    } catch (error) {
      // Handle connection error
      print('Error connecting to server: $error');
    }
  }

  Future<void> fetchDataForLog(String email, String password, context) async {
    print("yyyyy");
    final url = Uri.parse('https://shoppingo.onrender.com/api/v2.0/auth/login');
    _initPrefs();
    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['success'] == true) {
        // Signup successful
        print('login successful!');

        // Store token in shared preferences
        String token = jsonDecode(response.body)['token'];
        String role = jsonDecode(response.body)['user']['role'];
        await SharedStorage.setString('token', token);
        await SharedStorage.setString('role', role);

        Showsnack = true;

        var Snack = SnackBar(content: Text("تم تسجيل الدخول بنجاح"));
        ScaffoldMessenger.of(context).showSnackBar(Snack);

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) {
              return pages();
            },
          ),
        );
      } else {
        // Signup failed
        print('login failed!');
        String msg = jsonDecode(response.body)['message'];

        var Snack = SnackBar(
            content: Container(
          child: Text(
            msg,
            style: TextStyle(color: Colors.red),
          ),
        ));
        ScaffoldMessenger.of(context).showSnackBar(Snack);
      }
    } catch (error) {
      // Handle connection error
      print('Error connecting to server: $error');
    }
  }
}

class Log_in_model extends ChangeNotifier {
  Icon eye = const Icon(
    Icons.visibility,
  );
  var press = true;
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
}

class ForgetPass_model extends ChangeNotifier {
  var press = true;
  var press2 = true;
  var varify1, varify2, varify3, varify4;
  String varifyCode = "";
  Icon eye = const Icon(
    Icons.visibility,
  );

  Icon eye2 = const Icon(
    Icons.visibility,
  );
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

  verifyCode() {
    if (varify1 == null ||
        varify2 == null ||
        varify3 == null ||
        varify4 == null) {
      return false;
    }
    print(varify1);
    print(varify2);
    print(varify3);
    print(varify4);
    varifyCode = varify1 + varify2 + varify3 + varify4;
    print(varifyCode);

    if (varifyCode.length == 4) return true;
    notifyListeners();
  }

  bool vis = false;
  changeVis() {
    vis = !vis;
    notifyListeners();
  }

  notifyListeners();
  bool vis1 = false;
  changeVis1() {
    vis1 = !vis1;
    notifyListeners();
  }
}
