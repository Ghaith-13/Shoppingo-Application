import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/model/shoppingBasket.dart';

class OneOrder2 extends StatefulWidget {
  OneOrder2({Key? key}) : super(key: key);

  @override
  State<OneOrder2> createState() => _OneOrder2State();
}

class _OneOrder2State extends State<OneOrder2> {
  var quantity;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    // Color getColorFromString(String colorName) {
    //   switch (colorName) {
    //     case 'blue':
    //       return Colors.blue;
    //     case 'red':
    //       return Colors.red;
    //     // Add more cases for other color names if needed
    //     default:
    //       return Colors.black;
    //   }
    // }

    var model = Provider.of<shoppingBasketModel>(context);
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: width * 0.0002),
            borderRadius: BorderRadius.circular(width * 0.02)),
        margin: EdgeInsets.symmetric(vertical: height * 0.0055),
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              width: width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "القياس",
                        style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "ْxl",
                        style: TextStyle(fontSize: width * 0.035),
                      ),
                    ],
                  ),
                  Divider(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //   color: getColorFromString(widget.item['color']),
                        //   borderRadius: BorderRadius.circular(width * 0.02),
                        // ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(width * 002)),
                        height: height * 0.04,
                        width: width * 0.09,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        "اللون",
                        style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(height: height * 0.01),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        size: width * 0.05,
                      ),
                      label: Text(
                        "حذف الطلبية",
                        style: TextStyle(fontSize: width * 0.03),
                      ))
                ],
              ),
            ),
            Container(
              width: width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "اسم المتجر",
                    style: TextStyle(
                        fontSize: width * 0.035, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "الأوروبية غيث",
                    style: TextStyle(fontSize: width * 0.035),
                  ),
                  Divider(height: height * 0.01),
                  Text(
                    "السعر",
                    style: TextStyle(
                        fontSize: width * 0.035, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "75000",
                    style: TextStyle(fontSize: width * 0.035),
                  ),
                  Divider(height: height * 0.01),
                  Text(
                    "الكمية",
                    style: TextStyle(
                        fontSize: width * 0.035, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (quantity != 1) quantity = quantity - 1;
                          });
                        },
                        child: const Icon(
                          Icons.remove_circle,
                          color: Color.fromARGB(250, 203, 59, 62),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Text("2"),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            quantity = quantity + 1;

                            print(quantity);
                          });
                        },
                        child: const Icon(
                          Icons.add_circle,
                          color: Color.fromARGB(250, 203, 59, 62),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/1.jpg",
              width: width * 0.3,
            )
            // widget.item['product']['frontImgURL'] != null
            //     ? widget.i == 0
            //         ? Image.asset(
            //             "assets/1.jpg",
            //             width: width * 0.3,
            //           )
            //         : widget.i == 1
            //             ? Image.asset(
            //                 "assets/2.jpeg",
            //                 width: width * 0.3,
            //               )
            //             : Image.asset(
            //                 "assets/3.jpg",
            //                 width: width * 0.3,
            //               )
            //     : Image.asset(
            //         "assets/2.jpeg",
            //         width: width * 0.3,
            //       )
          ],
        ));
  }
}
