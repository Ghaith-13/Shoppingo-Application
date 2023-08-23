import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Formap extends ChangeNotifier {
  double lat = 34.0;
  double log = 36.0;
  var role = '';

  String ChooseValue = "";
  String countreyValue = "";
  String CategValue = "";
  var display_List;
  List<dynamic> infoUser = [];
  bool Showsnack = false;
  changeLatAndLog(double x, double y) {
    lat = x;
    log = y;
    notifyListeners();
  }

  void fetchData(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    // role = prefs.getString('role') ?? '';
    print(token);
    print("Hi");
    final url = await Uri.parse(
        'https://shoppingo.onrender.com/api/v2.0/store/getAllSeller');
    print("Bye");
    notifyListeners();

    try {
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      notifyListeners();
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> info = await jsonDecode(response.body);
        displydata(info['sellers']);
        print(info['sellers']);
        notifyListeners();
      } else {
        Showsnack = true;
        String msg = jsonDecode(response.body)['message'];

        QuickAlert.show(
          confirmBtnText: 'حسناً',
          confirmBtnColor: Color.fromARGB(255, 69, 151, 110),
          context: context,
          type: QuickAlertType.error,
          title: 'عذراً',
          titleColor: Colors.red,
          text: 'نعتذر منك , $msg',
        );
        notifyListeners();
      }
      notifyListeners();
    } catch (error) {
      QuickAlert.show(
          animType: QuickAlertAnimType.slideInDown,
          widget: Lottie.asset('./assets/failed.json',
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.07),
          confirmBtnText: 'حسناً',
          confirmBtnColor: Colors.red,
          context: context,
          type: QuickAlertType.error,
          title: 'عذراً',
          titleColor: Color.fromARGB(255, 190, 49, 38),
          text: error.toString());
      print('لا يوجد اتصال في الانترنت يرجى المحاولة لاحقاً');
    }
    notifyListeners();
  }

  TextEditingController _controller = TextEditingController();
  returncon() {
    return _controller;
  }

  deletecon() {
    _controller.clear();
  }

  void displydata(x) {
    infoUser = x;
    display_List = List.from(infoUser);
    notifyListeners();
  }

  void filterData(String query) {
    if (query == "") {
      display_List = infoUser;
      notifyListeners();
    }

    display_List = infoUser
        .where((item) =>
            item["storeName"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void clear() {
    display_List = infoUser;
    notifyListeners();
  }

  notifyListeners();
}
