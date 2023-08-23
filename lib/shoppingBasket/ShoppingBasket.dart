import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/model/shoppingBasket.dart';
import 'package:shoppingo/shoppingBasket/OneOrder.dart';
import 'package:shoppingo/shoppingBasket/checkout.dart';

int i = 0;

class ShoppingBasket extends StatefulWidget {
  const ShoppingBasket({Key? key}) : super(key: key);

  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<shoppingBasketModel>(context);
    if (i == 0) {
      model.GetAllOrders(context);
      i++;
    }
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    var items = [
      1,
      2,
      3,
      4,
      4,
      4,
      4,
      4,
      4,
    ];
    print(model.cartItems);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.009),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.02),
            ),
            width: width,
            height: height * 0.65,
            child: model.cartItems == null
                ? Lottie.asset('./assets/Basket.json')
                : model.cartItems.length == 0
                    ? Lottie.asset('./assets/Basket.json')
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < model.cartItems.length; i++)
                              OneOrder(item: model.cartItems[i], i: i)
                          ],
                        ),
                      ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${model.totalPrice}",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ": المجموع الكلي ",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          if (model.cartItems != null)
            model.cartItems.length == 0
                ? Text("")
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          model.removeAllItems(context);
                        },
                        icon: const Icon(Icons.delete),
                        label: Text("حذف الكل"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 600),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return checkout();
                              },
                            ),
                          );
                        },
                        child: Text("شراء"),
                      ),
                    ],
                  ),
        ],
      ),
    );
  }
}
