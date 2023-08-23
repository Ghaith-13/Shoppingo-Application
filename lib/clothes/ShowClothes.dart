import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../model/product.dart';
import 'Categories.dart';
import 'Items.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'ProductDetails/Product.dart';

class ClothesPage extends StatelessWidget {
  ClothesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => product_model()),
    ], child: SHOWCLOTHES());
  }
}

int i = 0, j = 0;

class SHOWCLOTHES extends StatefulWidget {
  const SHOWCLOTHES({super.key});

  @override
  State<SHOWCLOTHES> createState() => _SHOWCLOTHESState();
}

class _SHOWCLOTHESState extends State<SHOWCLOTHES> {
  var categories = ["رجالي", "نسائي", "الكل"];
  var prices = ["الكل", "من الاغلى إلى الأرخص", "من الأرخص إلى الاغلى"];
  var showFlog = false;
  var _isPressed = false;
  late String selectedValue;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final model = Provider.of<product_model>(context);
    String def = "....";
    List Allcoo = [];

    if (i == 0) {
      model.fetchData(context);

      print("all");
      i++;
    }

    var height = size.height;
    var width = size.width;
    return model.display_List != null
        ? Scaffold(
            body: ListView(
              children: [
                Container(
                  //temporary
                  // height: 500,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.021),
                  padding: EdgeInsets.only(top: height * 0.015),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.05),
                        topRight: Radius.circular(width * 0.05),
                      )),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.025),
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        height: height * 0.06,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 217, 217),
                            borderRadius: BorderRadius.circular(width * 0.05)),
                        child: Row(children: [
                          Icon(Icons.search,
                              color: Colors.red, size: width * 0.06),
                          Spacer(),
                          Container(
                              margin: EdgeInsets.only(left: width * 0.03),
                              height: height * 0.06,
                              width: width * 0.4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: ""),
                              ))
                        ]),
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.021),
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.019),
                          child: Row(children: [
                            Flexible(
                              child: DropdownButtonFormField2(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(250, 203, 59, 62),
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.021),
                                      borderSide: BorderSide(
                                          color: const Color.fromARGB(
                                              250, 203, 59, 62))),
                                ),
                                isExpanded: true,
                                hint: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 0),
                                      Text(
                                        'نوع الملابس',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: width * 0.038,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                items: categories
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Center(
                                            child: Text(
                                              item,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  if (value == "رجالي")
                                    model.filterGender('male');
                                  if (value == "نسائي")
                                    model.filterGender('female');
                                  if (value == "الكل")
                                    model.filterGender('all');
                                },
                                onSaved: (value) {},
                                buttonStyleData: ButtonStyleData(
                                  height: height * 0.05,
                                  padding: EdgeInsets.only(
                                      left: width * 0.038,
                                      right: width * 0.038),
                                ),
                                iconStyleData: IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  iconSize: width * 0.07,
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            Flexible(
                              child: DropdownButtonFormField2(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(250, 203, 59, 62),
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.021),
                                      borderSide: BorderSide(
                                          color: const Color.fromARGB(
                                              250, 203, 59, 62))),
                                ),
                                isExpanded: true,
                                hint: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 0),
                                      Text(
                                        'حسب السعر ',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: width * 0.038,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                items: prices
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Center(
                                            child: Text(
                                              item,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  print(value);
                                  if (value == "من الاغلى إلى الأرخص")
                                    model.filterprice("1");
                                  if (value == "من الأرخص إلى الاعلى")
                                    model.filterprice("2");
                                  if (value == "all") model.filterprice('all');
                                },
                                onSaved: (value) {
                                  selectedValue = value.toString();
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: height * 0.05,
                                  padding: EdgeInsets.only(
                                      left: width * 0.038,
                                      right: width * 0.038),
                                ),
                                iconStyleData: IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  iconSize: width * 0.06,
                                ),
                              ),
                            ),
                          ])),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.03),
                          child: Text("التصنيفات",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(250, 203, 59, 62)))),
                      Categ(),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.03),
                          child: Text("الألبسة",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(250, 203, 59, 62)))),
                      model.display_List != null
                          ? GridView.count(
                              childAspectRatio: width / height / 0.8,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              mainAxisSpacing: 2,
                              children: [
                                for (int i = 0;
                                    i < model.display_List.length;
                                    i++)
                                  AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeInOut,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(width * 0.02),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.16),
                                            blurRadius: 8,
                                            // categWomen[i][2] as bool ? 8 : 4,
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration:
                                                      const Duration(
                                                          seconds: 1),
                                                  transitionsBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    return ScaleTransition(
                                                      alignment:
                                                          Alignment.center,
                                                      scale: animation,
                                                      child: child,
                                                    );
                                                  },
                                                  pageBuilder: (context,
                                                      animation,
                                                      secondaryAnimation) {
                                                    return ProductDetails(
                                                      num: 0,
                                                    );
                                                  },
                                                ));

                                            //   _isPressed =showFlog[i] as bool;
                                            //  showFlog[i] = !_isPressed;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: width * 0.008,
                                              top: height * 0.009,
                                              right: width * 0.008,
                                              bottom: height * 0.0097),
                                          margin: EdgeInsets.symmetric(
                                              vertical: showFlog as bool
                                                  ? height * 0.007
                                                  : height * 0.005,
                                              horizontal: showFlog as bool
                                                  ? width * 0.006
                                                  : width * 0.005),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 0.04)),
                                          child:
                                              // !isFloatig
                                              //     ? Center(
                                              //         child: SpinKitThreeInOut(
                                              //             size: width * 0.1, color: Colors.red))
                                              //     :
                                              Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ((model.display_List[i]['price'] *
                                                                      100) /
                                                                  model.display_List[
                                                                              i]
                                                                          [
                                                                          "shippestProduct"]
                                                                      ['price'])
                                                              .toInt() <
                                                          100
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  width *
                                                                      0.005),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                47,
                                                                27,
                                                                139),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        width *
                                                                            0.04),
                                                          ),
                                                          child: Text(
                                                            "-" +
                                                                (((model.display_List[i]['price'] *
                                                                                100) /
                                                                            model.display_List[i]["shippestProduct"]['price'])
                                                                        .toInt())
                                                                    .toString() +
                                                                "%",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))
                                                      : Text(""),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        // _isfav = categWomen[i][3] as bool;
                                                        // categWomen[i][3] = !_isfav;
                                                      });
                                                    },
                                                    child: false
                                                        ? Icon(
                                                            Icons
                                                                .favorite_border,
                                                            size: width * 0.08,
                                                            color: const Color
                                                                    .fromARGB(
                                                                250,
                                                                203,
                                                                59,
                                                                62))
                                                        : Icon(Icons.favorite,
                                                            size: width * 0.08,
                                                            color: const Color
                                                                    .fromARGB(
                                                                250,
                                                                203,
                                                                59,
                                                                62)),
                                                  )
                                                ],
                                              ),
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    model.display_List[i]
                                                            ['shippestProduct']
                                                        ['frontImgURL']),
                                                radius: width * 0.17,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: height * 0.01,
                                                          left: width * 0.05),
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          // style:
                                                          //     DefaultTextStyle.of(context).style,
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                    'التقييم \n',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                    color: Colors
                                                                        .black)),
                                                            TextSpan(
                                                                text: '\t\t' +
                                                                    model
                                                                        .display_List[
                                                                            i][
                                                                            'meanRating']
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      width *
                                                                          0.046,
                                                                )),
                                                          ],
                                                        ),
                                                      )),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: height * 0.01,
                                                          right: width * 0.02,
                                                          left: width * 0.02),
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text: model
                                                                        .display_List[
                                                                            i][
                                                                            "shippestProduct"]
                                                                            [
                                                                            'price']
                                                                        .toString() +
                                                                    ' s.p \n',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        width *
                                                                            0.039)),
                                                            TextSpan(
                                                                text: model
                                                                        .display_List[
                                                                            i][
                                                                            'price']
                                                                        .toString() +
                                                                    ' s.p',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    fontSize:
                                                                        width *
                                                                            0.039,
                                                                    color: Colors
                                                                        .red)),
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              Container(
                                                child: Expanded(
                                                  flex: 2,
                                                  child: RatingBar.builder(
                                                    initialRating:
                                                        model.display_List[i]
                                                                ['meanRating'] *
                                                            1.0,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: width * 0.07,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width * 0.006),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
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
                            )
                          : Center(child: CircularProgressIndicator())
                    ],
                  ),
                )
              ],
            ),
          )
        : CircularProgressIndicator();
  }
}
