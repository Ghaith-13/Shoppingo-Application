import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import '../model/ForMap.dart';
import '../model/Map.dart';
import 'ApIforMap.dart';

class Mapping extends StatelessWidget {
  const Mapping({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LocationMap()),
      ChangeNotifierProvider(create: (context) => Formap()),
    ], child: TestMap());
  }
}

class TestMap extends StatefulWidget {
  const TestMap({super.key});

  @override
  State<TestMap> createState() => _TestMapState();
}

bool showMarkerInfo = false;

class _TestMapState extends State<TestMap> {
  List listOfPoints = [];
  List listOfPoints1 = [];
  List<LatLng> points = [];
  List listOfPoints2 = [];
  List listOfPoints22 = [];
  List<LatLng> points2 = [];
  double? LatCurrentUser;
  double? LogCurrentUser;
  bool? flog;
  bool? flag2;
  bool? flag1 = false;
  int i = 0;
  LatLng? selectedMarkerPosition = LatLng(0.0, 0.0);
  String? selectedMarkerTitle = "";
  var result = [], result1 = [];
  double total_distance = 1.0;
  double total_duration = 1.0;
  double total_distance1 = 1.0;
  double total_duration1 = 1.0;
  double storelong = 0.0;
  double storelat = 0.0;
  var storeName = "", locationStore = "", phoneNumber = "";

  void check() async {
    await Geolocator.requestPermission();
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    bool _serviceEnabled;
    StreamSubscription<Position> stream =
        Geolocator.getPositionStream().listen((event) {
      setState(() {
        LatCurrentUser = event.latitude;
        LogCurrentUser = event.longitude;
      });
    }) as StreamSubscription<Position>;
  }

  getCoordinates(double EndLat, double EndLog) async {
    total_distance = 0.0;
    total_duration = 0.0;

    total_distance1 = 0.0;
    total_duration1 = 0.0;

    print(storelong);
    print(total_distance);
    var response = await http
        .get(getRouteUrl(' ${storelong},${storelat}', ' ${EndLog},${EndLat}'));
    var response1 = await http
        .get(getRouteUrl1(' ${storelong},${storelat}', ' ${EndLog},${EndLat}'));

    setState(() {
      if (response.statusCode == 200) {
        print(23);
        var data = jsonDecode(response.body);
        var data1 = jsonDecode(response1.body);
        result = data['features'][0]['properties']['segments'][0]['steps'];
        print(result);
        listOfPoints = data['features'][0]['geometry']['coordinates'];
        print("jds");
        print(listOfPoints);
        listOfPoints1 =
            data['features'][0]['properties']['segments'][0]['steps'];
        points = listOfPoints
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
        print("jds");
        print(points);
        result.forEach((element) {
          print(element['distance']);
          // print(total_distance);

          total_distance += element['distance'] ?? 0;
        });
        result.forEach((ele) {
          total_duration += ele['duration'];
        });

        result1 = data1['features'][0]['properties']['segments'][0]['steps'];
        print(result1);

        listOfPoints2 = data['features'][0]['geometry']['coordinates'];
        listOfPoints22 =
            data['features'][0]['properties']['segments'][0]['steps'];
        points2 = listOfPoints2
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
        result1.forEach((element) {
          total_distance1 += element['distance'];
        });
        result1.forEach((ele) {
          total_duration1 += ele['duration'];
        });
        print("this is points");
        print(points);
      }
    });
    print(total_duration);
  }

  @override
  void initState() {
    super.initState();
    LatCurrentUser = 0.0;
    LogCurrentUser = 0.0;
    flog = false;
    flag1 = true;
    Future.delayed(Duration(seconds: 30), () {
      setState(() {
        flog = true;
      });
    });
    check();
  }

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<LocationMap>(context);
    final model = Provider.of<Formap>(context);
    MapController _mapController = MapController();
    if (i == 0) {
      model.fetchData(context);
      i++;
    }
    PopupController _popupLayerController = PopupController();

    return flog == true && model.display_List != null
        ? Scaffold(
            appBar: AppBar(),
            body: Stack(children: [
              FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                      zoom: 16, center: LatLng(34.702415, 36.723076)),
                  children: [
                    // Layer that adds the map
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    // Layer that adds points the map

                    PolylineLayer(
                      polylineCulling: false,
                      polylines: [
                        Polyline(
                            points: points, color: Colors.blue, strokeWidth: 5),
                      ],
                    ),

                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 90.0,
                          height: 90.0,
                          point: LatLng(34.702415, 36.723076),
                          builder: (ctx) => InkWell(
                            onTap: () => {
                              setState(() {
                                showMarkerInfo = true;
                                print("kcjdskfd");
                              })
                            },
                            child: Icon(Icons.location_on,
                                size: 50,
                                color: Color.fromARGB(255, 37, 166, 175)),
                          ),
                          anchorPos: AnchorPos.align(AnchorAlign.top),
                        ),
                        for (int i = 0;
                            i < model.display_List.length &&
                                model.display_List[i]['coo'].length != 0;
                            i++)
                          if (model.display_List[i]['coo'][0] > 0 &&
                              model.display_List[i]['coo'][1] > 0)
                            Marker(
                              width: 90.0,
                              height: 90.0,
                              point: LatLng(model.display_List[i]['coo'][1],
                                  model.display_List[i]['coo'][0]),
                              builder: (ctx) => InkWell(
                                  onTap: () => {
                                        setState(
                                          () {
                                            storelong =
                                                model.display_List[i]['coo'][0];
                                            storelat =
                                                model.display_List[i]['coo'][1];
                                            storeName = model.display_List[i]
                                                ['storeName'];
                                            locationStore = model
                                                .display_List[i]['location'];
                                            phoneNumber = model.display_List[i]
                                                ['storePhoneNumber'];
                                            showMarkerInfo = !showMarkerInfo;
                                            print("kcjdskfd");
                                          },
                                        )
                                      },
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Icon(
                                        Icons.location_on,
                                        size: 50,
                                        color: Color.fromARGB(250, 203, 59, 62),
                                      ),
                                    ],
                                  )),
                            ),
                      ],
                    ),
                  ]),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  top: flag1 == true ? 10 : -230,
                  left: 10,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 237, 237),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color.fromARGB(250, 203, 59, 62),
                          width: 2.0,
                        ),
                      ),
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "  الخريطة الدليلية     ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(" المحلات "),
                              Icon(Icons.location_on,
                                  size: 35,
                                  color: Color.fromARGB(255, 214, 32, 32)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("موقعي "),
                              Icon(Icons.location_on,
                                  size: 35,
                                  color: Color.fromARGB(255, 71, 227, 233)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  top: flag1 == true ? 10 : -230,
                  right: 10,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 237, 237),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color.fromARGB(250, 203, 59, 62),
                          width: 2.0,
                        ),
                      ),
                      height: 200,
                      // width:150,

                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "  عبر قيادة السيارة  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("كم"),
                                  Text(
                                      "${(total_distance! / 1000).toInt().toString()}"),
                                  SizedBox(width: 10),
                                  Icon(Icons.car_crash,
                                      color: Color.fromARGB(250, 203, 59, 62)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("ثا"),
                                  Text(
                                      "${((total_duration! % 60)).toInt().toString()}"),
                                  SizedBox(width: 3),
                                  Text("د"),
                                  Text(
                                      "${((total_duration! % 3600) / 60).toInt().toString()}"),
                                  SizedBox(width: 3),
                                  Text("سا"),
                                  Text(
                                      "${(total_duration! ~/ 3600).toInt().toString()}"),
                                  SizedBox(width: 5),
                                  Icon(Icons.watch,
                                      color: Color.fromARGB(250, 203, 59, 62)),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "   مشيا على الأقدام   ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("كم"),
                                  Text(
                                      "${(total_distance1! / 1000).toInt().toString()}"),
                                  SizedBox(width: 10),
                                  Icon(Icons.directions_walk,
                                      color: Color.fromARGB(250, 203, 59, 62)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("ثا"),
                                  Text(
                                      "${((total_duration1! % 60)).toInt().toString()}"),
                                  SizedBox(width: 3),
                                  Text("د"),
                                  Text(
                                      "${((total_duration1! % 3600) / 60).toInt().toString()}"),
                                  SizedBox(width: 3),
                                  Text("سا"),
                                  Text(
                                      "${(total_duration1! ~/ 3600).toInt().toString()}"),
                                  SizedBox(width: 5),
                                  Icon(Icons.watch,
                                      color: Color.fromARGB(250, 203, 59, 62)),
                                ],
                              ),
                              SizedBox(height: 10)
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  bottom: showMarkerInfo ? 100 : -200,
                  left: 0,
                  right: 0,
                  child: Container(
                    //
                    // color:Colors.green,
                    padding:
                        EdgeInsets.only(top: 2, left: 5, bottom: 2, right: 5),
                    child: Container(
                      height: 70,
                      padding: EdgeInsets.all(0.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Center(
                              child: Text(storeName,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 226, 44, 44)))),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_disabled),
                                  SizedBox(width: 10),
                                  Text(locationStore,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(width: 10),
                                  Text(phoneNumber,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Cart for User(Send & request)

                    width: 400,
                    height: 95,
                    margin:
                        EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(
                            0.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                  )),
            ]),
            floatingActionButton:
                Consumer<Formap>(builder: (context, formap, child) {
              return FloatingActionButton(
                backgroundColor: Color.fromARGB(250, 203, 59, 62),
                onPressed: () async {
                  print("uuu");

                  await getCoordinates(34.702415, 36.723076);
                },
                child: const Icon(
                  Icons.route,
                  color: Colors.black,
                ),
              );
            }))
        : Container(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          );
  }
}
