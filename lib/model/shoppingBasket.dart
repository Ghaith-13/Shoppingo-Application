import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shoppingBasketModel extends ChangeNotifier {
  var cartItems, totalPrice = 0;

  void GetAllOrders(context) async {
    print("Hello jutso");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var role = prefs.getString('role') ?? '';
    final url =
        await Uri.parse('https://shoppingo.onrender.com/api/v2.0/cart/getCart');

    try {
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        Map<String, dynamic> info = await jsonDecode(response.body);
        print(info);
        print("ehere is not anythimg");
        cartItems = info['cart']['cartItems'];
        totalPrice = info['cart']['totalPrice'];
        notifyListeners();
      } else {
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
      }
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
        text: '${error}',
      );
    }
    notifyListeners();
  }

  var Showsnack = false;
  void removeItem(id, context) async {
    print("Hello jutso");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var role = prefs.getString('role') ?? '';
    final url = await Uri.parse(
        'https://shoppingo.onrender.com/api/v2.0/cart/deleteItemFromCart/${id}');

    try {
      var response =
          await http.delete(url, headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 201) {
        Map<String, dynamic> info = await jsonDecode(response.body);
        print(info);
        cartItems = info['cart']['cartItems'];
        totalPrice = info['cart']['totalPrice'];
        Showsnack = true;
        print(info['cart']['cartItems'].length);
        var Snack = SnackBar(content: Text('${info['message']}'));
        ScaffoldMessenger.of(context).showSnackBar(Snack);
        notifyListeners();
      } else {
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
      }
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
        text: '${error}',
      );
    }
    notifyListeners();
  }

  void removeAllItems(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var role = prefs.getString('role') ?? '';
    final url = await Uri.parse(
        'https://shoppingo.onrender.com/api/v2.0/cart/deleteCartItems');

    try {
      var response =
          await http.delete(url, headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 201) {
        Map<String, dynamic> info = await jsonDecode(response.body);
        print(info);
        cartItems = [];
        totalPrice = 0;
        Showsnack = true;
        print(info['cart']['cartItems'].length);
        var Snack = SnackBar(content: Text('${info['message']}'));
        ScaffoldMessenger.of(context).showSnackBar(Snack);
        notifyListeners();
      } else {
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
      }
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
        text: '${error}',
      );
    }
    notifyListeners();
  }

  notifyListeners();
}
