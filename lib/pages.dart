import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/Favourites/mainFav.dart';
import 'package:shoppingo/Sellers/TestMap.dart';
import 'package:shoppingo/model/Map.dart';

import 'package:shoppingo/model/pages.dart';
import 'package:shoppingo/offers/mainOffer.dart';
import 'package:shoppingo/profile/profile.dart';

import 'Sellers/ShowSellers.dart';
import 'shoppingBasket/ShoppingBasket.dart';
import 'clothes/ShowClothes.dart';

class pages extends StatelessWidget {
  const pages({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final screens = [
      const ShoppingBasket(),
      const SHOWOFFER(),
      const SHOWCLOTHES(),
      SellerPage(),
      const SHOWFav(),
    ];
    final Title = [
      Text(
        "سلة المشتريات",
        style: TextStyle(fontSize: width * 0.07),
      ),
      Text(
        "العروض",
        style: TextStyle(fontSize: width * 0.07),
      ),
      Text(
        "المنتجات",
        style: TextStyle(fontSize: width * 0.07),
      ),
      Text(
        "المتاجر",
        style: TextStyle(fontSize: width * 0.07),
      ),
      Text(
        "المفضلة",
        style: TextStyle(fontSize: width * 0.07),
      ),
    ];
    final items = <Widget>[
      Icon(
        Icons.shopping_cart,
        size: width * 0.06,
      ),
      Icon(
        Icons.local_offer,
        size: width * 0.06,
      ),
      Icon(
        Icons.home,
        size: width * 0.06,
      ),
      Icon(
        Icons.store,
        size: width * 0.06,
      ),
      Icon(
        Icons.favorite,
        size: width * 0.06,
      ),
    ];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => homePage(),
        ),
      ],
      child: SafeArea(
        top: false,
        child: Scaffold(
          endDrawer: Drawer(
            child: Column(children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "G",
                    style: TextStyle(
                      fontSize: width * 0.09,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                accountName: Text(
                  "Ghaith",
                  style: TextStyle(fontSize: width * 0.035),
                ),
                accountEmail: Text(
                  "ghaethoo2001.go@gmail.com",
                  style: TextStyle(fontSize: width * 0.035),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 600),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return profile();
                        },
                      ));
                },
                child: const ListTile(
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الملف الشخصي",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(250, 203, 59, 62)),
                    ),
                  ),
                  leading: Text(""),
                  trailing: Icon(
                    Icons.person,
                    color: Color.fromARGB(250, 203, 59, 62),
                  ),
                ),
              )
            ]),
          ),
          extendBody: true,
          appBar: AppBar(
            title: Consumer<homePage>(
              builder: (context, value, child) {
                return Title[value.index];
              },
            ),
            centerTitle: true,
            elevation: 0,
          ),
          bottomNavigationBar: Theme(
              data: Theme.of(context)
                  .copyWith(iconTheme: IconThemeData(color: Colors.white)),
              child: Consumer<homePage>(
                builder: (context, model, child) {
                  return CurvedNavigationBar(
                    //background color
                    color: Color.fromARGB(250, 203, 59, 62),
                    //background color for active button
                    // buttonBackgroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    onTap: (value) {
                      model.changeIndex(value);
                    },
                    index: model.index,
                    height: height * 0.07,
                    items: items,
                    animationCurve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 300),
                  );
                },
              )),
          body: Consumer<homePage>(
            builder: (context, value, child) {
              return screens[value.index];
            },
          ),
        ),
      ),
    );
  }
}
