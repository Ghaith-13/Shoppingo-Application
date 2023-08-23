import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingo/auth/Log_in.dart';

class product_model extends ChangeNotifier {
  var index = 0;
  var image;
  bool check = true;
  var radioSelected;
  bool radioXS = false;
  bool radioS = false;
  bool radioM = false;
  bool radioL = false;
  bool radioXL = false;
  bool radio2XL = false;
  bool radio3XL = false;
  bool radio4XL = false;
  bool radio5XL = false;
  bool radio6XL = false;

  selectedRadio(value) {
    radioSelected = value;
    if (radioSelected == "XS") {
      var radioXS = true;
      var radioS = false;
      var radioM = false;
      var radioL = false;
      var radioXL = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "S") {
      var radioS = true;
      var radioXS = false;
      var radioM = false;
      var radioL = false;
      var radioXL = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "M") {
      var radioM = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioXL = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "L") {
      var radioL = true;
      var radioXS = false;
      var radioS = false;
      var radioM = false;
      var radioXL = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "XL") {
      var radioXL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "2XL") {
      var radio2XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radioXL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "3XL") {
      var radio3XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radioXL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "4XL") {
      var radio4XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radio3XL = false;
      var radioXL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "5XL") {
      var radio5XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radioXL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "6XL") {
      var radio6XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radioXL = false;
      notifyListeners();
    }
    notifyListeners();
  }

  // product_model(List<String> images) {
  //   Images = images;
  //   image = Images[1];
  // }
  List<List<bool>> isPressed = [
    [false, false, false],
    [false, false, false]
  ];
  void togglePressedState(int i, int j) {
    isPressed[i][j] = !isPressed[i][j];
    notifyListeners();
  }

  bool selectRadio(value) {
    radioSelected = value;
    if (radioSelected == "XS") {
      return radioXS;
    } else if (radioSelected == "S") {
      print(radioS);
      return radioS;

      notifyListeners();
    } else if (radioSelected == "M") {
      return radioM;

      notifyListeners();
    } else if (radioSelected == "L") {
      return radioL;
    } else if (radioSelected == "XL") {
      return radioXL;
    } else if (radioSelected == "2XL") {
      return radio2XL;
    } else if (radioSelected == "3XL") {
      return radio3XL;
    } else if (radioSelected == "4XL") {
      return radio4XL;
    } else if (radioSelected == "5XL") {
      return radio5XL;
    } else if (radioSelected == "6XL") {
      return radio6XL;
    }
    return false;
  }

  nextimg(Images) {
    if (Images.length != index + 1) {
      image = Images[index + 1];
      index = index + 1;
      check = false;
      notifyListeners();
    }
    notifyListeners();
  }

  preimg(Images) {
    if (index != 0) {
      image = Images[index - 1];
      index = index - 1;
      check = false;
      notifyListeners();
    }

    notifyListeners();
  }

  var role = '';

  String ChooseValue = "";
  String countreyValue = "";
  String CategValue = "";
  var display_List = [];
  var details;

  var display_List_similar = [];
  var display_list_map = [];
  String Typegender = "";

  List<dynamic> infoUser = [];
  List<dynamic> infoUsersimilar = [];
  List<dynamic> infoUserMap = [];
  bool Showsnack = false;
  void fetchData(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    // role = prefs.getString('role') ?? '';
    print(token);
    print("Hi");
    final url = await Uri.parse(
        'https://shoppingo.onrender.com/api/v2.0/shop/getAllproduct');
    print("Bye");
    notifyListeners();

    try {
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      notifyListeners();
      if (response.statusCode == 200) {
        Map<String, dynamic> info = await jsonDecode(response.body);
        displydata(info['uniqueProducts']);

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

  void fetchDataForProduct(id, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    // role = prefs.getString('role') ?? '';
    print(token);
    print("Hi");
    final url = await Uri.parse(
        'https://shoppingo.onrender.com/api/v2.0/shop/getProductDetails/${id}');
    print("Bye");
    notifyListeners();

    try {
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      notifyListeners();
      if (response.statusCode == 200) {
        Map<String, dynamic> info = await jsonDecode(response.body);
        displydata3(info["product"]["seller"]["coo"]);
        displydata4(info["product"]["brand"].toString());
        displydata5(info["product"]["_id"].toString());

        print(info["product"]);
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

  void fetchSimilarData(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    // role = prefs.getString('role') ?? '';
    print(token);
    print("Hi");
    final url = await Uri.parse(
        'https://shoppingo.onrender.com/api/v2.0/shop/getSimilarProducts');
    print("Bye");
    notifyListeners();

    try {
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      notifyListeners();
      if (response.statusCode == 200) {
        Map<String, dynamic> info = await jsonDecode(response.body);
        displydata1(info["recommendation"]);
        print("similar");
        print(info["recommendation"]);
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

  void displydata(x) {
    infoUser = x;
    display_List = List.from(infoUser);
    notifyListeners();
  }

  void displydata1(x) {
    infoUsersimilar = x;
    display_List_similar = List.from(infoUsersimilar);
    notifyListeners();
  }

  void displydata3(x) {
    infoUsersimilar = x;
    details = List.from(infoUsersimilar);
    print("//////////////////");
    print(details);
    notifyListeners();
  }

  String brand = '';
  String ID = "";
  void displydata4(x) {
    brand = x;
    ID = brand;
    print("//////////////////*******");
    print(brand);
    notifyListeners();
  }

  String brand2 = '';
  String ID2 = "";
  void displydata5(x) {
    brand2 = x;
    ID2 = brand2;
    print("/****************************//////////////////*******");
    print(brand2);
    notifyListeners();
  }
//   void filterData(String query) {
//     if (query == "") {
//       display_List = infoUser;
//       notifyListeners();
//     }

//     display_List = infoUser
//         .where((item) =>
//             item["storeName"]!.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     notifyListeners();
//   }
  void filterGender(String query) {
    if (query == "all") {
      display_List = infoUser;

      notifyListeners();
    } else {
      print(query);
      display_List = infoUser
          .where((item) => item["shippestProduct"]['gender']!
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
      print(display_List.length);
      notifyListeners();
    }
  }

  void filterprice(String query) {
    if (query == "all") {
      display_List = infoUser;

      notifyListeners();
    }
    if (query == "1") {
      display_List
          .sort((a, b) => b["price"].toInt().compareTo(a["price"].toInt()));
      print(display_List.length);
      notifyListeners();
    } else {
      print(query);
      display_List
          .sort((a, b) => a["price"].toInt().compareTo(b["price"].toInt()));
      print(display_List.length);
      notifyListeners();
    }
  }

  String productId = "";
  changeProductid(String id) {
    productId = id;
    notifyListeners();
  }

  String showId() {
    return productId;
  }

  void fetchMapData(context, id, long, lat, brand) async {
    print("roumniaaaasdfgh");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    // role = prefs.getString('role') ?? '';
    print(id);
    final queryParameters = {
      'long': long,
      'lat': lat,
      'brand': brand,
    };
    final url = await Uri.https('shoppingo.onrender.com',
        '/api/v2.0/shop/getMapProduct/${id}', queryParameters);

    print("Bye");
    notifyListeners();

    try {
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      notifyListeners();
      print(
          "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
      print(response.body);
      if (response.statusCode == 200) {
        Map info = await jsonDecode(response.body);
        print("asdf");
        print(info['shippestProduct']);
        print(info['nearestProduct']);
        print(info['productsWithDiscount']);
        print(info['otherProducts']);

        // displydata1(info["recommendation"]);

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
      print(
          "[[[[[[[[[[[[[[[[[[[[[[[asdaksdkajsdkj[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");

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

  var ship = [], near = [], offer = [], other = [], y = [];
  void displayMap(c) {
    y = c;
    ship = List.from(y);
    print(ship);
    notifyListeners();
  }

  void displayMap1(c) {
    y = c;
    near = List.from(y);
    notifyListeners();
  }

  void displayMap2(c) {
    y = c;
    offer = List.from(y);
    notifyListeners();
  }

  void displayMap3(c) {
    y = c;
    other = List.from(y);
    notifyListeners();
  }

  void displydata2(x) {
    infoUserMap = x;
    display_list_map = List.from(infoUserMap);
    notifyListeners();
  }

  var sizep, colorp = "";
  Future<void> fetchDataToCart(
      productId, size, color, quantity, price, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    // role = prefs.getString('role') ?? '';
    print(token);
    print("Hi");
    print("yyyyy");
    final url =
        Uri.parse('https://shoppingo.onrender.com/api/v2.0/cart/addItemToCart');

    try {
      final response = await http.post(
        url,
        headers: {'Authorization': 'Bearer $token'},
        body: {
          'productId': productId,
          'size': size,
          'color': color,
          'quantity': quantity,
          'price': price
        },
      );
      if (response.statusCode == 200) {
        // Signup successful
        print('add successful!');

        Showsnack = true;

        var Snack = SnackBar(content: Text("تم  الاضافة بنجاح"));
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
                return LOGGING();
              },
            ));
      } else {
        // Signup failed
        print('adding failed!');
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
///forMap
 