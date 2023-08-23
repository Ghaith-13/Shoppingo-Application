import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile_model extends ChangeNotifier {
  var editName = false;
  var editEmail = false;
  var editStore = false;
  var editAddress = false;
  var editCode = false;

  var radioselected;
  var wePay = false;
  var delevary = false;

  changeName() {
    if (editName)
      editName = false;
    else
      editName = true;
    notifyListeners();
  }

  changeEmail() {
    if (editEmail)
      editEmail = false;
    else
      editEmail = true;
    notifyListeners();
  }

  changeStore() {
    if (editStore)
      editStore = false;
    else
      editStore = true;
    notifyListeners();
  }

  changeAddress() {
    if (editAddress)
      editAddress = false;
    else
      editAddress = true;
    notifyListeners();
  }

  changeCode() {
    if (editCode)
      editCode = false;
    else
      editCode = true;
    notifyListeners();
  }

  checkRadioButton(value) {
    radioselected = value;

    wePay = !wePay;
    print(wePay);
    notifyListeners();
  }

  checkRadioButton2(value) {
    radioselected = value;
    print(value);

    delevary = !delevary;

    notifyListeners();
  }

  var infoUser, infoSeller, role;
  var Tab = 1;
  changeTab(value) {
    Tab = value;
    notifyListeners();
  }

  void updateUserinfo(
    var fullName,
    var storeName,
    var location,
    var oldPassword,
    var newPassword,
    var imgURL,
    context,
  ) async {
    print(fullName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    print(token);

    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://shoppingo.onrender.com/api/v2.0/auth/updateInfo'),
    );

    request.headers['Authorization'] = 'Bearer $token';

    // Add parameters using `fields`
    if (fullName != null) request.fields['fullName'] = fullName;
    if (storeName != null) request.fields['storeName'] = storeName;
    if (location != null) request.fields['location'] = location;
    if (oldPassword != null) request.fields['oldPassword'] = oldPassword;
    if (newPassword != null) request.fields['newPassword'] = newPassword;

    // Add image file using `files`
    if (imgURL != null) {
      http.MultipartFile imageFile = await http.MultipartFile.fromPath(
        'imgURL',
        imgURL,
      );
      request.files.add(imageFile);
    }

    print('Request Method: ${request.method}');
    print('Request URL: ${request.url}');
    print('Request Headers: ${request.headers}');
    print('Request Fields: ${request.fields}');
    print('Request Files: ${request.files}');
    try {
      var response = await request.send();
      if (response.statusCode == 201) {
        const Snack = SnackBar(content: Text(" تم الحفظ بنجاح"));
        ScaffoldMessenger.of(context).showSnackBar(Snack);
        var responseData = await http.Response.fromStream(response);
        var responseObject = json.decode(responseData.body);
        print(responseData);
        var infoUser = responseObject["user"];

        notifyListeners();
      } else {
        var responseData = await http.Response.fromStream(response);
        var responseObject = json.decode(responseData.body);
        String msg = responseObject['message'];
        print("object");
        print(responseObject);
        QuickAlert.show(
          confirmBtnText: 'حسناً',
          confirmBtnColor: Colors.red,
          context: context,
          type: QuickAlertType.error,
          title: 'عذراً',
          titleColor: Colors.red,
          text: 'نعتذر منك , $msg',
        );
      }
    } catch (error) {
      print(error);
      QuickAlert.show(
        animType: QuickAlertAnimType.slideInDown,
        widget: Lottie.asset(
          './assets/failed.json',
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.07,
        ),
        confirmBtnText: 'حسناً',
        confirmBtnColor: Colors.red,
        context: context,
        type: QuickAlertType.error,
        title: 'عذراً',
        titleColor: Color.fromARGB(255, 190, 49, 38),
      );
    }
    notifyListeners();
  }
  // Future<void> updateUserinfo(var fullName, var storeName, var location,
  //     var oldPassword, var newPassword, var imgURL, context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('token') ?? '';
  //   print(token);
  //   final url =
  //       Uri.parse('https://shoppingo.onrender.com/api/v2.0/auth/updateInfo');
  //   try {
  //     final response = await http.put(
  //       url,
  //       headers: {'Authorization': 'Bearer $token'},
  //       body: {
  //         if (fullName != null) 'fullName': fullName,
  //         if (storeName != null) 'storeName': storeName,
  //         if (location != null) 'location': location,
  //         if (oldPassword != null) 'oldPassword': oldPassword,
  //         if (newPassword != null) 'newPassword': newPassword,
  //         if (imgURL != null) 'imgURL': imgURL,
  //       },
  //     );
  //     print(response.body); // Add this line
  //     if (response.statusCode == 201) {
  //       // Signup successful
  //       print("تم التعديل");
  //       var Snack = SnackBar(content: Text("تم تسجيل الدخول بنجاح"));
  //       ScaffoldMessenger.of(context).showSnackBar(Snack);
  //     } else {
  //       String msg = jsonDecode(response.body)['message'];
  //       print(msg);
  //       var Snack = SnackBar(
  //           content: Container(
  //         child: Text(
  //           msg,
  //           style: TextStyle(color: Colors.red),
  //         ),
  //       ));
  //       ScaffoldMessenger.of(context).showSnackBar(Snack);
  //     }
  //   } catch (error) {
  //     // Handle connection error
  //     print('Error connecting to server: $error');
  //   }
  // }

  void getAllInfoUser(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    role = prefs.getString('role') ?? '';
    final url = await Uri.parse(
        'https://shoppingo.onrender.com/api/v2.0/auth/getUserInfo');

    try {
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        Map<String, dynamic> info = await jsonDecode(response.body);

        infoUser = info["user"];
        infoSeller = info["seller"];

        print(infoSeller);
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

class statistics_model extends ChangeNotifier {
  String dropdownvalue = 'السنة الحالية';
  var OptionSelected = 0;

  // List of items in our dropdown menu
  var items = [
    'السنة الحالية',
    'الشهر الحالي',
    'اليوم الحالي',
  ];
  changeSelcted(String? newValue) {
    dropdownvalue = newValue!;
    if (dropdownvalue == "السنة الحالية") {
      OptionSelected = 0;
      print("1");
      notifyListeners();
    } else if (dropdownvalue == 'الشهر الحالي') {
      OptionSelected = 1;
      notifyListeners();
    } else {
      OptionSelected = 2;
      notifyListeners();
    }
    notifyListeners();
  }
}

class PurchasesModel extends ChangeNotifier {
  bool update = false;
  bool updateandsave = false;
  changeUpdate() {
    update = true;
    notifyListeners();
  }

  changeUpdateAndASave() {
    updateandsave = !updateandsave;
    notifyListeners();
  }

  var PurchasesDone = [
    'حسب المعالجة',
    'تمت معالجته',
    'لم تتم معالجته',
  ];
  var PurchasesPrice = [
    'حسب السعر',
    'من الأرخص إلى الأغلى',
    'من الأغلى إلى الأرخص'
  ];

  String formattedDate =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  notifyListeners();
}

class Item {
  String contentSize;
  int quantity;
  List<Color> colors;

  Item(
      {required this.contentSize,
      required this.quantity,
      required this.colors});
}

class addProduct_model extends ChangeNotifier {
  /////for http request
  String? gender = "male";

  Color primarycolor = Color.fromRGBO(255, 255, 255, 1);
  bool male = true;
  bool female = false;
  var dropdownValueForMale = 'بنطال';
  var dropdownValueForFemale = 'تنورة';
  var dropdownValueForType = 'رياضي';
  late Color colorPicker;

  List<String> Sizes = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    '3XL',
    '4XL',
    '5XL',
    '6XL'
  ];
  List<String> selectedSizes = [];
  var numberOfProduct = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0].cast<int>();
  var ColorSelected = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ].cast<int>();

  List<Item> items = [];

  changeSelect(value) {
    gender = value.toString();
    if (gender == "male") {
      male = true;
      female = false;
    } else {
      male = false;
      female = true;
    }
    notifyListeners();
  }

  changeDropDown1(String? newValue) {
    dropdownValueForMale = newValue!;
    print(dropdownValueForMale);

    notifyListeners();
  }

  changeDropDown2(String? newValue) {
    dropdownValueForFemale = newValue!;
    print(dropdownValueForFemale);

    notifyListeners();
  }

  changeDropDownForType(String? newValue) {
    dropdownValueForType = newValue!;
    print(dropdownValueForType);

    notifyListeners();
  }

  bool sizesContainer = false;
  changeDropdownMultiSelected(value) {
    selectedSizes = value;
    if (selectedSizes.length != 0) {
      sizesContainer = true;
      notifyListeners();
    } else {
      sizesContainer = false;
      notifyListeners();
    }
    print(selectedSizes);
    notifyListeners();
  }

  increase(index) {
    numberOfProduct[index] = numberOfProduct[index] + 1;
    notifyListeners();
  }

  decrese(index) {
    if (numberOfProduct[index] != 0)
      numberOfProduct[index] = numberOfProduct[index] - 1;
    notifyListeners();
  }

  showColorPicker(index) {
    ColorSelected[index] = 1;
    print(ColorSelected[index]);
    notifyListeners();
  }

  hideColorPicker(index) {
    ColorSelected[index] = 0;
    notifyListeners();
  }

  changeColorPicker(color) {
    primarycolor = color;
    colorPicker = color;
    print(colorPicker);
    notifyListeners();
  }

  List<List<Color>> Colors = [[], [], [], [], [], [], [], [], [], []];
  List<List<String>> Colors2 = [[], [], [], [], [], [], [], [], [], []];

  addColorPicker(index) {
    ColorSelected[index] = 0;
    String hexColor = '#${colorPicker.value.toRadixString(16).substring(2)}';
    Colors2[index].add(hexColor);
    Colors[index].add(colorPicker);
    print(Colors);
    notifyListeners();
  }

  removeColor(index, color) {
    Colors[index].remove(color);
    notifyListeners();
  }

  File? image;
  pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporrary = File(image.path);
      this.image = imageTemporrary;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed To Pick Image");
    }
  }

  File? image2;
  Future<void> pickImage2() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      final imageTemporary = File(pickedImage.path);
      image2 = imageTemporary;
      notifyListeners();
    } on PlatformException catch (e) {
      print('Failed to pick image');
    }
  }

  var description, brand, modelNumber, price, fixedDiscount;

  void sendData(
    var type,
    var style,
    var variations,
    var frontImgURL,
    var backImgURL,
    context,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://shoppingo.onrender.com/api/v2.0/shop/addProduct'),
    );

    request.headers['Authorization'] = 'Bearer $token';

    // Add parameters using `fields`
    request.fields['type'] = type;
    request.fields['gender'] = gender!;

    request.fields['style'] = style;
    request.fields['description'] = description;
    request.fields['brand'] = brand;
    request.fields['modelNumber'] = modelNumber;
    request.fields['price'] = price;
    request.fields['fixedDiscount'] = fixedDiscount;
    request.fields['variations'] = variations as String;

    // Add image file using `files`
    if (frontImgURL != null) {
      http.MultipartFile imageFile = await http.MultipartFile.fromPath(
        'frontImgURL',
        frontImgURL,
      );
      request.files.add(imageFile);
    }

    if (backImgURL != null) {
      http.MultipartFile imageFile2 = await http.MultipartFile.fromPath(
        'backImgURL',
        backImgURL,
      );
      request.files.add(imageFile2);
    }

    print('Request Method: ${request.method}');
    print('Request URL: ${request.url}');
    print('Request Headers: ${request.headers}');
    print('Request Fields: ${request.fields}');
    print('Request Files: ${request.files}');
    try {
      var response = await request.send();
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${await response.stream.bytesToString()}');
      // Rest of your code for handling the response
      if (response.statusCode == 201) {
        const Snack = SnackBar(content: Text(" تم الحفظ بنجاح"));
        print("yesssss");
        notifyListeners();
      } else {
        var responseData = await http.Response.fromStream(response);
        var responseObject = json.decode(responseData.body);
        print(responseObject);
        String msg = responseObject['message'];
        print("object");
        print(responseObject);
        QuickAlert.show(
          confirmBtnText: 'حسناً',
          // confirmBtnColor: Colors.red,
          context: context,
          type: QuickAlertType.error,
          title: 'عذراً',
          // titleColor: Colors.red,
          text: 'نعتذر منك , $msg',
        );
      }
    } catch (error) {
      print(error);
      QuickAlert.show(
        animType: QuickAlertAnimType.slideInDown,
        widget: Lottie.asset(
          './assets/failed.json',
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.07,
        ),
        confirmBtnText: 'حسناً',
        // confirmBtnColor: Colors.red,
        context: context,
        type: QuickAlertType.error,
        title: 'عذراً',
        titleColor: Color.fromARGB(255, 190, 49, 38),
      );
    }
    notifyListeners();
  }

  notifyListeners();
}
