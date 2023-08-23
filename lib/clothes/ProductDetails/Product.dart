import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../model/product.dart';
import 'map.dart';

class ProductDetails extends StatelessWidget {
  final int num;

  const ProductDetails({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => product_model()),
    ], child: Product(num: num));
  }
}

class Product extends StatelessWidget {
  final int num;

  Product({Key? key, required this.num}) : super(key: key);

  @override
  int i = 0;
  Widget build(BuildContext context) {
    final controller2 = TextEditingController();
    var idp, sizep, colorp, quantityp, pricep;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var sizes;
    var showFlog = false;
    final model = Provider.of<product_model>(context);

    String def = "....";
    List Allcoo = [];
    Color hextoColor(String code) {
      print(Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000));
      return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    if (i == 0) {
      print(num);
      model.fetchData(context);
      model.fetchSimilarData(context);
      print("all");
      i++;
    }
    var colors = [Colors.red];

    var Images = [
      "assets/2.jpeg",
      "assets/1.jpg",
      "assets/11.jpeg",
      "assets/2.jpeg"
    ];
    var image = "assets/2.jpeg";
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.03),
          child: Column(
            children: [
              //Images
              SizedBox(
                  width: width * 0.9,
                  height: height * 0.3,
                  child: Consumer<product_model>(
                    builder: (context, model, child) {
                      return Stack(children: [
                        model.check
                            ? Center(
                                child: Image(
                                    image: NetworkImage(model.display_List[num]
                                        ["shippestProduct"]["frontImgURL"])),
                              )
                            : Center(
                                child: Image(
                                    image: NetworkImage(model.display_List[num]
                                        ["shippestProduct"]["backImgURL"])),
                              ),
                        Positioned(
                          top: height * 0.135,
                          child: InkWell(
                            onTap: () {
                              model.preimg(Images);
                            },
                            child: Container(
                                color: Color.fromARGB(250, 203, 59, 62),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: height * 0.135,
                          child: InkWell(
                            onTap: () {
                              model.nextimg(Images);
                            },
                            child: Container(
                                color: Color.fromARGB(250, 203, 59, 62),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ]);
                    },
                  )),
              //EndImages
              Divider(),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  ": الوصف",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 29, 74),
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: height * 0.05,
                width: width,
                child: SingleChildScrollView(
                  child: Text(
                    model.display_List[num]["shippestProduct"]["description"],
                    style: TextStyle(fontSize: width * 0.04),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  ": الكميةوالألوان والقياسات",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 29, 74),
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),

              GridView.count(
                  childAspectRatio: width / height / 0.05,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 1,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  mainAxisSpacing: 2,
                  children: [
                    // for (int i = 0;
                    //     i <
                    //         model
                    //             .display_List[num]["shippestProduct"]
                    //                 ['variations']
                    //             .length;
                    //     i++)
                    //   Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Center(
                    //         child: Container(
                    //           width: width * 0.2,
                    //           alignment: Alignment.centerRight,
                    //           child: RadioListTile(
                    //             selected: false,
                    //             title: Padding(
                    //               padding: EdgeInsets.only(right: width * 0.2),
                    //               child: Text(
                    //                 model.display_List[num]["shippestProduct"]
                    //                     ['variations'][i]['size'],
                    //                 textAlign: TextAlign.end,
                    //               ),
                    //             ),
                    //             value: model.display_List[num]
                    //                     ["shippestProduct"]['variations'][i]
                    //                 ['size'],
                    //             groupValue: model.radioSelected,
                    //             onChanged: (value) {
                    //               model.selectedRadio(value);
                    //               model.sizep = model.display_List[num]
                    //                       ["shippestProduct"]['variations'][i]
                    //                   ['size'];
                    //               print(sizep);
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //           alignment: Alignment.centerRight,
                    //           child: Padding(
                    //               padding: EdgeInsets.only(right: width * 0.02),
                    //               child: Text(
                    //                 model.display_List[num]["shippestProduct"]
                    //                         ['variations'][i]['quantity']
                    //                     .toString(),
                    //                 style: TextStyle(fontSize: width * 0.04),
                    //               ))),
                    //       SingleChildScrollView(
                    //         scrollDirection: Axis.horizontal,
                    //         child: Row(
                    //           children: [
                    //             for (int j = 0;
                    //                 j <
                    //                     model
                    //                         .display_List[num]
                    //                             ["shippestProduct"]
                    //                             ['variations'][i]['colors']
                    //                         .length;
                    //                 j++)
                    //               GestureDetector(
                    //                 onTap: () => {
                    //                   model.togglePressedState(i, j),
                    //                   if (model.isPressed[i][j] == true)
                    //                     {
                    //                       model.colorp = model.display_List[num]
                    //                               ["shippestProduct"]
                    //                           ['variations'][i]['colors'][j],
                    //                       print(colorp)
                    //                     }
                    //                 },
                    //                 child: Container(
                    //                   margin: EdgeInsets.symmetric(
                    //                       horizontal: width * 0.01),
                    //                   decoration: BoxDecoration(
                    //                     borderRadius:
                    //                         BorderRadius.circular(width * 0.02),
                    //                     color: // Change to white when pressed
                    //                         model.display_List[num]
                    //                                             ["shippestProduct"]
                    //                                         ['variations'][i]
                    //                                     ['colors'][0] !=
                    //                                 "red"
                    //                             ? hextoColor(model.display_List[
                    //                                             num]
                    //                                         ["shippestProduct"]
                    //                                     ['variations'][i]
                    //                                 ['colors'][j])
                    //                             : Colors.red,
                    //                     border: Border.all(
                    //                       color: model.isPressed[i][j] == false
                    //                           ? Colors.black
                    //                           : Colors
                    //                               .yellow, // Change to black when pressed
                    //                     ),
                    //                   ),
                    //                   width: width * 0.09,
                    //                   height: height * 0.05,
                    //                 ),
                    //               )
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),

                    Text("xl")
                  ]),
              //Collors

              Divider(),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  ": الكمية المطلوبة ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 29, 74),
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                // controller: controller2,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "ادخل الكمية المطلوبة",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: width * 0.01),
                  ),
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  ": السعر ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 29, 74),
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  model.display_List[num]['price'].toString(),
                  style: TextStyle(
                    color: Color.fromARGB(255, 17, 29, 74),
                    fontSize: width * 0.05,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        print(model.colorp);
                        model.fetchDataToCart(
                            model.display_List[num]["shippestProduct"]["_id"],
                            model.sizep,
                            model.colorp,
                            controller2.text,
                            model.display_List[num]['price'].toString(),
                            context);
                      },
                      icon: Icon(Icons.shopping_cart),
                      label: Text("اضف الى"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          model.changeProductid(model.display_List[num]
                                  ["shippestProduct"]["_id"]
                              .toString());
                          print(model.productId);
                          print("model.productId");
                          model.fetchMapData(
                              context,
                              model.display_List[num]["shippestProduct"]["_id"],
                              "34.811708",
                              "36.504571",
                              "Goo");
                          Future.delayed(Duration(seconds: 0), () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(seconds: 1),
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
                                    return MappingProduct(
                                        coo: model.details,
                                        brand: model.brand,
                                        id: model.brand2);
                                  },
                                ));
                          });
                        },
                        child: Text("عرض المنتج على الخريطة"))
                  ],
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  ": العناصر المتشابهة ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 29, 74),
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),
              model.display_List_similar != null &&
                      model.display_List_similar.length != 0
                  ? GridView.count(
                      childAspectRatio: width / height / 0.8,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      mainAxisSpacing: 1,
                      children: [
                        // for (int i = 0;
                        //     i < model.display_List_similar.length;
                        //     i++)
                        //   AnimatedContainer(
                        //       duration: Duration(milliseconds: 200),
                        //       curve: Curves.easeInOut,
                        //       decoration: BoxDecoration(
                        //         borderRadius:
                        //             BorderRadius.circular(width * 0.02),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.16),
                        //             blurRadius: 8,
                        //             // categWomen[i][2] as bool ? 8 : 4,
                        //           ),
                        //         ],
                        //       ),
                        //       child: InkWell(
                        //         onTap: () {
                        //           Navigator.push(
                        //               context,
                        //               PageRouteBuilder(
                        //                 transitionDuration:
                        //                     const Duration(seconds: 1),
                        //                 transitionsBuilder: (context, animation,
                        //                     secondaryAnimation, child) {
                        //                   return ScaleTransition(
                        //                     alignment: Alignment.center,
                        //                     scale: animation,
                        //                     child: child,
                        //                   );
                        //                 },
                        //                 pageBuilder: (context, animation,
                        //                     secondaryAnimation) {
                        //                   return ProductDetails(num: i);
                        //                 },
                        //               ));

                        //           //   _isPressed =showFlog[i] as bool;
                        //           //  showFlog[i] = !_isPressed;
                        //         },
                        //         child: Container(
                        //           padding: EdgeInsets.only(
                        //               left: width * 0.008,
                        //               top: height * 0.009,
                        //               right: width * 0.008,
                        //               bottom: height * 0.0097),
                        //           margin: EdgeInsets.symmetric(
                        //               vertical: showFlog as bool
                        //                   ? height * 0.007
                        //                   : height * 0.005,
                        //               horizontal: showFlog as bool
                        //                   ? width * 0.006
                        //                   : width * 0.005),
                        //           decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius:
                        //                   BorderRadius.circular(width * 0.04)),
                        //           child:
                        //               // !isFloatig
                        //               //     ? Center(
                        //               //         child: SpinKitThreeInOut(
                        //               //             size: width * 0.1, color: Colors.red))
                        //               //     :
                        //               Column(
                        //             children: [
                        //               Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   ((model.display_List_similar[i]
                        //                                           ['price'] *
                        //                                       100) /
                        //                                   model.display_List_similar[
                        //                                               i][
                        //                                           "shippestProduct"]
                        //                                       ['price'])
                        //                               .toInt() <
                        //                           100
                        //                       ? Container(
                        //                           padding: EdgeInsets.all(
                        //                               width * 0.005),
                        //                           decoration: BoxDecoration(
                        //                             color: const Color.fromARGB(
                        //                                 255, 47, 27, 139),
                        //                             borderRadius:
                        //                                 BorderRadius.circular(
                        //                                     width * 0.04),
                        //                           ),
                        //                           child: Text(
                        //                             "-" +
                        //                                 (((model.display_List_similar[i]
                        //                                                     [
                        //                                                     'price'] *
                        //                                                 100) /
                        //                                             model.display_List_similar[i]
                        //                                                     [
                        //                                                     "shippestProduct"]
                        //                                                 [
                        //                                                 'price'])
                        //                                         .toInt())
                        //                                     .toString() +
                        //                                 "%",
                        //                             style: TextStyle(
                        //                                 fontSize: width * 0.04,
                        //                                 color: Colors.white,
                        //                                 fontWeight:
                        //                                     FontWeight.bold),
                        //                           ))
                        //                       : Text(""),
                        //                   InkWell(
                        //                     onTap: () {},
                        //                     child: false
                        //                         ? Icon(Icons.favorite_border,
                        //                             size: width * 0.08,
                        //                             color: const Color.fromARGB(
                        //                                 250, 203, 59, 62))
                        //                         : Icon(Icons.favorite,
                        //                             size: width * 0.08,
                        //                             color: const Color.fromARGB(
                        //                                 250, 203, 59, 62)),
                        //                   )
                        //                 ],
                        //               ),
                        //               CircleAvatar(
                        //                 backgroundImage: NetworkImage(model
                        //                         .display_List_similar[i]
                        //                     ['shippestProduct']['frontImgURL']),
                        //                 radius: width * 0.17,
                        //               ),
                        //               SizedBox(
                        //                 height: 10,
                        //               ),
                        //               Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Container(
                        //                       padding: EdgeInsets.only(
                        //                           bottom: height * 0.01,
                        //                           left: width * 0.05),
                        //                       alignment: Alignment.centerRight,
                        //                       child: RichText(
                        //                         text: TextSpan(
                        //                           // style:
                        //                           //     DefaultTextStyle.of(context).style,
                        //                           children: <TextSpan>[
                        //                             TextSpan(
                        //                                 text: 'التقييم \n',
                        //                                 style: TextStyle(
                        //                                     fontWeight:
                        //                                         FontWeight.bold,
                        //                                     fontSize:
                        //                                         width * 0.03,
                        //                                     color:
                        //                                         Colors.black)),
                        //                             TextSpan(
                        //                                 text: '\t\t' +
                        //                                     model
                        //                                         .display_List_similar[
                        //                                             i][
                        //                                             'meanRating']
                        //                                         .toString(),
                        //                                 style: TextStyle(
                        //                                   color: Colors.black,
                        //                                   fontWeight:
                        //                                       FontWeight.bold,
                        //                                   fontSize:
                        //                                       width * 0.046,
                        //                                 )),
                        //                           ],
                        //                         ),
                        //                       )),
                        //                   Container(
                        //                       padding: EdgeInsets.only(
                        //                           bottom: height * 0.01,
                        //                           right: width * 0.02,
                        //                           left: width * 0.02),
                        //                       alignment: Alignment.centerRight,
                        //                       child: RichText(
                        //                         text: TextSpan(
                        //                           children: <TextSpan>[
                        //                             TextSpan(
                        //                                 text: model
                        //                                         .display_List_similar[
                        //                                             i][
                        //                                             "shippestProduct"]
                        //                                             ['price']
                        //                                         .toString() +
                        //                                     ' s.p \n',
                        //                                 style: TextStyle(
                        //                                     color: Colors.black,
                        //                                     fontWeight:
                        //                                         FontWeight.bold,
                        //                                     fontSize:
                        //                                         width * 0.039)),
                        //                             TextSpan(
                        //                                 text: model
                        //                                         .display_List_similar[i]
                        //                                             ['price']
                        //                                         .toString() +
                        //                                     ' s.p',
                        //                                 style: TextStyle(
                        //                                     fontWeight:
                        //                                         FontWeight.bold,
                        //                                     decoration:
                        //                                         TextDecoration
                        //                                             .lineThrough,
                        //                                     fontSize:
                        //                                         width * 0.039,
                        //                                     color: Colors.red)),
                        //                           ],
                        //                         ),
                        //                       )),
                        //                 ],
                        //               ),
                        //               Container(
                        //                 child: Expanded(
                        //                   flex: 2,
                        //                   child: RatingBar.builder(
                        //                     initialRating:
                        //                         model.display_List_similar[i]
                        //                                 ['meanRating'] *
                        //                             1.0,
                        //                     minRating: 1,
                        //                     direction: Axis.horizontal,
                        //                     allowHalfRating: true,
                        //                     itemCount: 5,
                        //                     itemSize: width * 0.07,
                        //                     itemPadding: EdgeInsets.symmetric(
                        //                         horizontal: width * 0.006),
                        //                     itemBuilder: (context, _) =>
                        //                         const Icon(
                        //                       Icons.star,
                        //                       color: Colors.amber,
                        //                     ),
                        //                     onRatingUpdate: (rating) {
                        //                       print(rating);
                        //                     },
                        //                   ),
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       )),
                        Text("data")
                      ],
                    )
                  : Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}
