import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoppingo/clothes/ProductDetails/Product.dart';

class favWidget extends StatefulWidget {
  const favWidget({super.key});

  @override
  State<favWidget> createState() => _favWidgetState();
}

bool isFloatig = false;

@override
class _favWidgetState extends State<favWidget>
    with SingleTickerProviderStateMixin {
  late AnimatedContainer _controller;
  late Animation<Offset> _animation;
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isFloatig = true;
      });
    });
  }

  var categWomen = [
    ["assets/11.jpeg", "قبعات", false, true],
    ["assets/12.jpg", "فستان", false, true],
    ["assets/13.jpg", "تنورة", false, true],
    ["assets/14.jpeg", "بنطال", false, true],
    ["assets/13.jpg", "تنورة", false, false],
    ["assets/14.jpeg", "بنطال", false, true],
  ];
  bool _isPressed = false;
  bool _isfav = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return GridView.count(
      childAspectRatio: height * 0.0007,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 2,
      children: [
        for (int i = 0; i < categWomen.length; i++)
          if (categWomen[i][3] as bool == true)
            AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      categWomen[i][2] as bool ? width * 0.02 : width * 0.023),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: categWomen[i][2] as bool ? 8 : 4,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isPressed = categWomen[i][2] as bool;
                      categWomen[i][2] = !_isPressed;
                      print(categWomen[i][2]);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: width * 0.008,
                        top: height * 0.009,
                        right: width * 0.008,
                        bottom: height * 0.0097),
                    margin: EdgeInsets.symmetric(
                        vertical: categWomen[i][2] as bool
                            ? height * 0.007
                            : height * 0.005,
                        horizontal: categWomen[i][2] as bool
                            ? width * 0.006
                            : width * 0.005),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width * 0.04)),
                    child: !isFloatig
                        ? Center(
                            child: SpinKitThreeInOut(
                                size: width * 0.1, color: Colors.red))
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(width * 0.005),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 47, 27, 139),
                                        borderRadius:
                                            BorderRadius.circular(width * 0.04),
                                      ),
                                      child: Text(
                                        "-50%",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isfav = categWomen[i][3] as bool;
                                        categWomen[i][3] = !_isfav;
                                      });
                                    },
                                    child: categWomen[i][3] as bool == false
                                        ? Icon(Icons.favorite_border,
                                            size: width * 0.08,
                                            color: const Color.fromARGB(
                                                250, 203, 59, 62))
                                        : Icon(Icons.favorite,
                                            size: width * 0.08,
                                            color: const Color.fromARGB(
                                                250, 203, 59, 62)),
                                  )
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isPressed = categWomen[i][2] as bool;
                                      categWomen[i][2] = !_isPressed;
                                    });
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          transitionDuration:
                                              const Duration(milliseconds: 600),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return ScaleTransition(
                                              alignment: Alignment.center,
                                              scale: animation,
                                              child: child,
                                            );
                                          },
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return Product(
                                              num: 1,
                                            );
                                          },
                                        ));
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(width * 0.026),
                                      child: Image.asset("${categWomen[i][0]}",
                                          width: width * 0.4,
                                          height: height * 0.18))),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          bottom: height * 0.01,
                                          left: width * 0.05),
                                      alignment: Alignment.centerRight,
                                      child: RichText(
                                        text: TextSpan(
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'التقييم \n',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.046)),
                                            TextSpan(
                                                text: '\t\t5.0',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width * 0.046,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Container(
                                      padding: EdgeInsets.only(
                                          bottom: height * 0.01,
                                          right: width * 0.02,
                                          left: width * 0.02),
                                      alignment: Alignment.centerRight,
                                      child: RichText(
                                        text: TextSpan(
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '4000 s.p \n',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.046)),
                                            TextSpan(
                                                text: '7000 s.p',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: width * 0.046,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                              Container(
                                child: Expanded(
                                  flex: 2,
                                  child: RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: width * 0.07,
                                    itemPadding: EdgeInsets.symmetric(
                                        horizontal: width * 0.006),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                  ),
                )),
      ],
    );
  }
}
