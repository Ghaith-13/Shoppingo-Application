// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:sho/clothes/ProductDetails/Product.dart';
// import 'package:provider/provider.dart';
// import 'package:sho/model/product.dart';
// class itemsPage extends StatelessWidget {
//  itemsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(providers: [
 
//       ChangeNotifierProvider(create: (context) => product_model()),
//     ], child: ItemsWidget());
//   }
// }

// int i = 0, j = 0;
// class ItemsWidget extends StatefulWidget {
//   const ItemsWidget({super.key});

//   @override
//   State<ItemsWidget> createState() => _ItemsWidgetState();
// }

// bool isFloatig = false;

// @override
// class _ItemsWidgetState extends State<ItemsWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimatedContainer _controller;
//   late Animation<Offset> _animation;
//   void initState() {
//     super.initState();

//     Future.delayed(const Duration(seconds: 3), () {
//       setState(() {
//         isFloatig = true;
//       });
//     });
//   }

//   var categWomen = [
//     ["assets/11.jpeg", "قبعات", false, false],
//     ["assets/12.jpg", "فستان", false, false],
//     ["assets/13.jpg", "تنورة", false, false],
//     ["assets/14.jpeg", "بنطال", false, false],
//     ["assets/13.jpg", "تنورة", false, false],
//     ["assets/14.jpeg", "بنطال", false, false],
//   ];
//   bool _isPressed = false;
//   bool _isfav = false;
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;
//      final model = Provider.of<product_model>(context);
//     String def = "....";
//     List Allcoo = [];
//     if (i == 0)  {
//       model.fetchData(context);
//       // print(model.display_List.length);
//       i++;
//     }
    
//     return 
      
//     ;});
//   }
// }
