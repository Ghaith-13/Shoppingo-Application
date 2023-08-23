import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shoppingo/shoppingBasket/OneOrder2.dart';

class checkout extends StatelessWidget {
  const checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.02, horizontal: width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "ملاحظة : أجرة الشحن من أجل كل منتج 5000 ل.س",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        color: const Color.fromARGB(255, 136, 105, 24)),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "ملاحظة : السعر الكلي لكل قسم يتضمن سعر المنتجات في هذا القسم إضافة إلى أجور شحنها",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        color: const Color.fromARGB(255, 136, 105, 24)),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    ": طرق الدفع للمنتجات",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        color: const Color.fromARGB(255, 136, 105, 24)),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "الدفع عند الاستلام",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            color: const Color.fromARGB(255, 136, 105, 24)),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        "|  |",
                        style: TextStyle(
                            fontSize: width * 0.08,
                            color: const Color.fromARGB(255, 17, 29, 74)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "WePay الدفع عن طريق موقع",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            color: const Color.fromARGB(255, 136, 105, 24)),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        "|  |",
                        style: TextStyle(
                            fontSize: width * 0.08,
                            color: const Color.fromARGB(255, 63, 179, 127)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "WePay الدفع عن طريق موقع",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            color: const Color.fromARGB(255, 136, 105, 24)),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        "|  ",
                        style: TextStyle(
                            fontSize: width * 0.08,
                            color: const Color.fromARGB(255, 17, 29, 74)),
                      ),
                      Text(
                        "|",
                        style: TextStyle(
                            fontSize: width * 0.08,
                            color: const Color.fromARGB(255, 63, 179, 127)),
                      ),
                    ],
                  ),
                  //////////////////////////// LOGO ////////////////////////////
                  Center(
                    child: Image.asset(
                      'assets/Logo.png',
                      height: height * 0.05,
                    ),
                  ),

                  ////////////////////////////First section ////////////////////////////
                  Container(
                    width: width,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: const Color.fromARGB(255, 17, 29, 74),
                          width: width * 0.01,
                        ),
                        right: BorderSide(
                          color: const Color.fromARGB(255, 17, 29, 74),
                          width: width * 0.01,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          children: [for (int i = 0; i < 3; i++) OneOrder2()]),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: const Color.fromARGB(255, 17, 29, 74),
                          width: width * 0.01,
                        ),
                        right: BorderSide(
                          color: const Color.fromARGB(255, 17, 29, 74),
                          width: width * 0.01,
                        ),
                      ),
                    ),
                    child: const Text(
                      "ل.س 10000000000000000",
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 29, 74),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  //////////////////////
                  const Divider(
                    color: Color.fromARGB(250, 203, 59, 62),
                  ),
                  /////////////////////
                  ////////////////////////////second section ////////////////////////////
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    width: width,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: const Color.fromARGB(255, 63, 179, 127),
                          width: width * 0.01,
                        ),
                        right: BorderSide(
                          color: const Color.fromARGB(255, 63, 179, 127),
                          width: width * 0.01,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          children: [for (int i = 0; i < 3; i++) OneOrder2()]),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: const Color.fromARGB(255, 63, 179, 127),
                          width: width * 0.01,
                        ),
                        right: BorderSide(
                          color: const Color.fromARGB(255, 63, 179, 127),
                          width: width * 0.01,
                        ),
                      ),
                    ),
                    child: const Text(
                      "ل.س 10000000000000000",
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 29, 74),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  //////////////////////
                  const Divider(
                    color: Color.fromARGB(250, 203, 59, 62),
                  ),
                  /////////////////////
                  ////////////////////////////third section ////////////////////////////
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    width: width,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: const Color.fromARGB(255, 17, 29, 74),
                          width: width * 0.01,
                        ),
                        right: BorderSide(
                          color: const Color.fromARGB(255, 63, 179, 127),
                          width: width * 0.01,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          children: [for (int i = 0; i < 3; i++) OneOrder2()]),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: const Color.fromARGB(255, 17, 29, 74),
                          width: width * 0.01,
                        ),
                        right: BorderSide(
                          color: const Color.fromARGB(255, 63, 179, 127),
                          width: width * 0.01,
                        ),
                      ),
                    ),
                    child: const Text(
                      "ل.س 10000000000000000",
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 29, 74),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  //////////////////////////// LOGO ////////////////////////////
                  Center(
                    child: Image.asset(
                      'assets/Logo.png',
                      height: height * 0.05,
                    ),
                  ),
                  ////////////////////////////////////////////////////////////////////////////////
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.3,
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            labelText: 'الاسم الأخير',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      SizedBox(
                        width: width * 0.3,
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            labelText: 'الاسم الأوسط',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      SizedBox(
                        width: width * 0.3,
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            labelText: 'الاسم الأول',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  SizedBox(
                    width: width,
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        label: Text(
                          "الأيميل",
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  SizedBox(
                    width: width,
                    child: IntlPhoneField(
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        hintText: ' رقم الموبايل',
                        suffixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'SY',
                      onChanged: (phone) {},
                      onCountryChanged: (country) {},
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            label: Text(
                              "المحافظة",
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.15,
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: TextFormField(
                          initialValue: 'سوريا',
                          enabled: false,
                          decoration: const InputDecoration(
                            label: Text(
                              "الدولة",
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  SizedBox(
                    width: width,
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        label: Text(
                          "العنوان",
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: const Color.fromARGB(250, 203, 59, 62),
                          width: width * 0.01,
                        ),
                        right: BorderSide(
                          color: const Color.fromARGB(250, 203, 59, 62),
                          width: width * 0.01,
                        ),
                      ),
                    ),
                    child: const Text(
                      "ل.س 10000000000000000",
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 29, 74),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Center(
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 17, 29, 74),
                            Color.fromARGB(250, 203, 59, 62)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                          ),
                        ),
                        child: const Text(
                          'شراء',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        ));
  }
}
