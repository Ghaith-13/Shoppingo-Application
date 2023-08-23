import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/Intro_Slider_Screen.dart';
import 'package:shoppingo/Sellers/ShowSellers.dart';
import 'package:shoppingo/Sellers/map.dart';
import 'package:shoppingo/auth/Sign_up.dart';
import 'package:shoppingo/model/ForMap.dart';
import 'package:shoppingo/model/Map.dart';
import 'package:shoppingo/model/product.dart';
import 'package:shoppingo/model/profile.dart';
import 'package:shoppingo/model/shoppingBasket.dart';
import 'package:shoppingo/pages.dart';
import 'package:shoppingo/splash_screen.dart';

import 'auth/Log_in.dart';
import 'clothes/ProductDetails/Product.dart';
import 'clothes/ProductDetails/map.dart';
import 'clothes/ShowClothes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => profile_model()),
        ChangeNotifierProvider(create: (_) => addProduct_model()),
        ChangeNotifierProvider(create: (_) => LocationMap()),
        ChangeNotifierProvider(create: (_) => Formap()),
        ChangeNotifierProvider(create: (_) => product_model()),
        ChangeNotifierProvider(create: (_) => shoppingBasketModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch:
                const Color.fromARGB(250, 203, 59, 62).asMaterialColor),
        home: SplashScreen(),
      ),
    );
  }
}

extension ToMaterialColor on Color {
  MaterialColor get asMaterialColor {
    Map<int, Color> shades = [
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ].asMap().map(
        (key, value) => MapEntry(value, withOpacity(1 - (1 - (key + 1) / 10))));

    return MaterialColor(value, shades);
  }
}
