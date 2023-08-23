import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:lottie/lottie.dart';

import 'package:latlong2/latlong.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../model/ForMap.dart';
import '../model/Map.dart';
import 'TestMap.dart';

class SellerPage extends StatelessWidget {
  SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LocationMap()),
      ChangeNotifierProvider(create: (context) => Formap()),
    ], child: Sellers());
  }
}

int i = 0, j = 0;

class Sellers extends StatelessWidget {
  const Sellers({super.key});

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<LocationMap>(context);
    final model = Provider.of<Formap>(context);
    String def = "....";
    List Allcoo = [];
    model.fetchData(context);

    if (model.display_List != null) {
      for (int j = 0; j < model.display_List.length; j++) {
        Allcoo.add(model.display_List[j]['coo']);
        //  print(Allcoo);
      }
      if (location.off == false && location.off1 == false) {
        location.getCurrent();
        print("rounnna");
      }
      if (location.off && j == 0) {
        print(location.lati);
        doing() async {
          await location.getCoordinates(Allcoo, 36.72307, 34.702415);
          location.flog = true;
          print(location.total_distance1);
          j++;
        }

        doing();
      }
    }

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return model.display_List != null
        ? Scaffold(
            body: Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(width * 0.036),
                    child: SizedBox(
                      width: width * 1.1,
                      child: TextField(
                        controller: model.returncon(),
                        onChanged: (value) => {model.filterData(value)},
                        maxLines: 1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.02),
                              borderSide: BorderSide(
                                  width: width * 0.008,
                                  color: Color.fromARGB(250, 203, 59, 62))),
                          hintText: "",
                          alignLabelWithHint: false,
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          prefixIcon: IconButton(
                              onPressed: () {
                                model.clear();
                                model.deletecon();
                              },
                              icon: Icon(Icons.close)),
                          prefixIconColor: Color.fromARGB(250, 203, 59, 62),
                          suffixIcon: Icon(Icons.search),
                          suffixIconColor: Color.fromARGB(250, 203, 59, 62),
                        ),
                      ),
                    ),
                  ),
                  // Text("sdjdh"),

                  SizedBox(height: height * 0.04),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 1),
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
                                  return Mapping();
                                },
                              ));
                        },
                        child: Text("اضغط هنا",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.035,
                            ))),
                    SizedBox(width: width * 0.018),
                    Text("لرؤية المتاجر على الخريطة",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.035,
                        )),
                  ]),
                  // SizedBox(height:height*0.02),
                  Expanded(
                      child: location.total_distance.length !=
                                  model.display_List.length &&
                              model.display_List == null
                          ? Center(
                              child:
                                  Lottie.asset('./assets/Loading Files.json'),
                            )
                          : model.display_List.length == 0
                              ? Center(
                                  child: Lottie.asset('./assets/one.json'),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: model.display_List.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          top: height * 0.007,
                                          left: width * 0.01,
                                          bottom: height * 0.007,
                                          right: width * 0.01),
                                      //Cart for User(Send & request)

                                      width: width * 0.9,
                                      margin: EdgeInsets.only(
                                          left: width * 0.024,
                                          top: height * 0.02,
                                          right: width * 0.024,
                                          bottom: height * 0.01),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(
                                              width * 0.0,
                                              height * 0.003,
                                            ),
                                            blurRadius: width * 0.02,
                                            spreadRadius: width * 0.003,
                                          ), //BoxShadow
                                          //BoxShadow
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          // SizedBox(width: 5.w),

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(height: height * 0.02),
                                              RichText(
                                                textAlign: TextAlign.end,
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: model.display_List[
                                                                  index]
                                                              ['storeName'] +
                                                          "\n",
                                                      style: TextStyle(
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 12, 12, 12),
                                                          fontSize:
                                                              width * 0.043,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text: model.display_List[
                                                                  index]
                                                              ['location'] +
                                                          "\n",
                                                      style: TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: width * 0.04,
                                                      )),
                                                  TextSpan(
                                                      text:
                                                          " يبعد مشيا عبر الأقدام",
                                                      style: TextStyle(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 12, 9, 0),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: width * 0.03,
                                                      )),
                                                  TextSpan(
                                                      text: location.off1
                                                          ? " ${location.total_distance[index]} كم"
                                                          : "${def} كم",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: width * 0.03,
                                                      )),
                                                  TextSpan(
                                                      text: " وعبر السيارة",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: width * 0.03,
                                                      )),
                                                  TextSpan(
                                                      text: location.off1
                                                          ? "${location.total_distance1[index]} كم\n"
                                                          : "${def} كم\n",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: width * 0.03,
                                                      )),
                                                  TextSpan(
                                                      text: " يستغرق زمنا مشيا",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: width * 0.03,
                                                      )),
                                                  TextSpan(
                                                      text: location.off1
                                                          ? " ${location.total_duration[index]}  ساعة"
                                                          : "${def}  ساعة",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: width * 0.03,
                                                      )),
                                                  TextSpan(
                                                      text: " وعبر السيارة",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: width * 0.03,
                                                      )),
                                                  TextSpan(
                                                      text: location.off1
                                                          ? "  ${location.total_duration1[index]} دقيقة"
                                                          : "${def}  ساعة",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: width * 0.03,
                                                      )),
                                                ]),
                                              ),
                                            ],
                                          ),

                                          // SizedBox(height: 5.w),

                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                '${model.display_List[index]['storeImageURL']}'),
                                            radius: width * 0.1,
                                          ),
                                          //  SizedBox(width: 5.w),
                                        ],
                                      ),
                                    );
                                  }))
                ]),
          ))
        : Center(child: CircularProgressIndicator());
  }
}
