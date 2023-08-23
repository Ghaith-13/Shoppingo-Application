// ignore_for_file: unused_local_variable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import '../model/ForMap.dart';
import 'ApIforMap.dart';

class MapScreen extends StatefulWidget {
  // const MapScreen({super.key

  // });
  final String num;

  const MapScreen({Key? key, required this.num}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  List listOfPoints = [];
  List listOfPoints1 = [];
  List<LatLng> points = [];
  List listOfPoints2 = [];
  List listOfPoints22 = [];
  List<LatLng> points2 = [];
  String NameStart = "";
  String NameEnd = "";
  double? total_distance = 1.0;
  double? total_duration = 1.0;
  double? total_distance1 = 1.0;
  double? total_duration1 = 1.0;
  double? EndLat = 1.0;
  double? EndLog = 1.0;
  AnimationController? _animController;
  AnimationController? _controller;
  CurvedAnimation? _animation;
  double l1 = 0.1;
  double l2 = 0.1;
  // late LocationData data = new LocationData.fromMap({'lat1': 0.0, 'log1': 1.0});
  bool showMarkerInfo = false;
  LatLng? selectedMarkerPosition = LatLng(0.0, 0.0);
  String? selectedMarkerTitle = "";
  var r = [];

  var r1 = [];
  bool flag1 = false;
  bool flag2 = false;
  void onMarkerTap(LatLng position, String title) {
    // print("skdhsk");
    setState(() {
      flag2 = true;
      showMarkerInfo = true;
      selectedMarkerPosition = position;
      selectedMarkerTitle = title;
    });
  }

  // Method to consume the OpenRouteService API
  getCoordinates(double x, double y) async {
    EndLat = x;
    EndLog = y;
    print("rounia");
    print(EndLog);
    var response = await http
        .get(getRouteUrl("36.723076,34.702415", ' ${EndLog},${EndLat}'));
    var response1 = await http
        .get(getRouteUrl1("36.723076,34.70415", ' ${EndLog},${EndLat}'));

    setState(() {
      if (response.statusCode == 200) {
        // print(23);
        var data = jsonDecode(response.body);
        var data1 = jsonDecode(response1.body);
        r = data['features'][0]['properties']['segments'][0]['steps'];
        //  print(r);
        listOfPoints = data['features'][0]['geometry']['coordinates'];
        listOfPoints1 =
            data['features'][0]['properties']['segments'][0]['steps'];
        points = listOfPoints
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
        r.forEach((element) {
          print(element['name']);

          total_distance = (total_distance! + element['distance'])!;
        });
        r.forEach((ele) {
          total_duration = total_distance! + ele['duration'];
        });

        r1 = data1['features'][0]['properties']['segments'][0]['steps'];
        print(r);
        NameStart = r[0]['name'];

        listOfPoints2 = data['features'][0]['geometry']['coordinates'];
        listOfPoints22 =
            data['features'][0]['properties']['segments'][0]['steps'];
        points2 = listOfPoints2
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
        r1.forEach((element) {
          total_distance1 = total_distance1! + element['distance'];
        });
        r1.forEach((ele) {
          total_duration1 = total_duration1! + ele['duration'];
        });
        print(points);
      }
    });
    print(total_duration);
  }

  // Location location = Location();
  double lat = 0.0, log = 0.0;
  void check() async {
    print(5);
    await Geolocator.requestPermission();
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    bool _serviceEnabled;
    StreamSubscription<Position> stream =
        Geolocator.getPositionStream().listen((event) {
      setState(() {
        l1 = event.latitude;
        l2 = event.longitude;
      });
    }) as StreamSubscription<Position>;
  }

  bool flog = false;
  Timer? time;
  @override
  void initState() {
    super.initState();
    getCoordinates(0.0, 0.0);
    print(widget.num);
    print("ssssssssssssssssssss");
    Future.delayed(Duration(seconds: 30), () {
      setState(() {
        flog = true;
      });
    });
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 750),
        reverseDuration: const Duration(milliseconds: 750));
    _animation =
        CurvedAnimation(parent: _controller!, curve: Curves.easeOutBack);
    // _tileLayerController = MapTileLayerController();
    _controller!.repeat(min: 0.1, max: 1.0, reverse: true);
    check();

    // });
//  });
  }

  @override
  void dispose() {
    _controller!.stop();
    _controller!.dispose();
    // _markers.clear();
    super.dispose();
  }

  MapController _mapController = MapController();
  Map args = {"num": 2.0, "lat": 34.8105, "log": 36.129876};
  @override
  Widget build(BuildContext context) {
    if (widget.num == "2")
      args = (ModalRoute.of(context)?.settings.arguments ?? {}) as Map;
    print(args);
    //  print(args.toString()) ;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Formap()),
        ],
        child: flog
            ? Scaffold(
                appBar: widget.num == "2" ? AppBar() : null,
                body: Stack(children: [
                  FlutterMap(
                    options: MapOptions(
                        zoom: 13, center: LatLng(34.702415, 36.723076)),
                    children: [
                      // Layer that adds the map
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                      // Layer that adds points the map
                      PolylineLayer(
                        polylineCulling: false,
                        polylines: [
                          Polyline(
                              points: points,
                              color: Colors.blue,
                              strokeWidth: 5),
                        ],
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 90.0,
                            height: 90.0,
                            point: LatLng(34.702415, 36.723076),
                            builder: (ctx) => ScaleTransition(
                                alignment: Alignment.bottomCenter,
                                scale: _animation!,
                                child: InkWell(
                                  onTap: () => onMarkerTap(
                                      LatLng(34.702415, 36.723076), "Syria"),
                                  child: Icon(Icons.location_on,
                                      size: 50, color: Colors.lightGreen),
                                )),
                          ),
                          Marker(
                            width: 90.0,
                            height: 90.0,
                            point: LatLng(args['lat']!, args['log']!),
                            builder: (ctx) => ScaleTransition(
                                alignment: Alignment.bottomCenter,
                                scale: _animation!,
                                child: Icon(Icons.location_on,
                                    size: 50, color: Colors.yellow)),
                          ),
                          Marker(
                            width: 90.0,
                            height: 90.0,
                            point: LatLng(34.722189, 36.720005),
                            builder: (ctx) => ScaleTransition(
                                alignment: Alignment.bottomCenter,
                                scale: _animation!,
                                child: Icon(
                                  Icons.location_on,
                                  size: 50,
                                )),
                          ),
                          Marker(
                            width: 90.0,
                            height: 90.0,
                            point: LatLng(34.810179, 36.83970),
                            builder: (ctx) => ScaleTransition(
                                alignment: Alignment.bottomCenter,
                                scale: _animation!,
                                child: Icon(Icons.location_on,
                                    size: 50, color: Colors.red)),
                          ),
                        ],
                      ),

                      // Polylines layer
                    ],
                  ),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      top: flag1 ? 30 : -230,
                      left: 10,
                      child: Center(
                        child: Container(
                          height: 230,
                          // width:150,
                          color: Color.fromARGB(255, 132, 199, 134),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 10.h),
                              Text(
                                "  عبر قيادة السيارة  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("كم"),
                                  Text(
                                      "${(total_distance! / 1000).toInt().toString()}"),
                                  SizedBox(width: 10),
                                  Icon(Icons.car_crash),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Icon(Icons.watch),
                                ],
                              ),
                              SizedBox(height: 10.h),
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
                                  Icon(Icons.directions_walk),
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
                                  Icon(Icons.watch),
                                ],
                              ),
                              SizedBox(height: 10.h)
                            ],
                          ),
                        ),
                      )),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      bottom: showMarkerInfo ? 0 : -200,
                      left: 0,
                      right: 0,
                      child: Container(
                        //
                        // color:Colors.green,
                        padding: EdgeInsets.only(
                            top: 2.sp, left: 5.sp, bottom: 2.sp, right: 5.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 4.h),
                                Positioned(
                                    top: 3,
                                    left: 10,
                                    child: IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        setState(() {
                                          showMarkerInfo = false;
                                          flag2 = false;
                                        });
                                      },
                                    )),
                              ],
                            ),

                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.h),
                                  RichText(
                                    textAlign: TextAlign.end,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "ألبسة أناقة للبنات\n",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  221, 12, 12, 12),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: "محل ألبسة_الحضارة_شارع العشاق",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12.sp,
                                          )),
                                    ]),
                                  ),
                                ]),

                            // SizedBox(width: 5.w),

                            CircleAvatar(
                              backgroundImage: AssetImage('assets/1.png'),
                              radius: 22.r,
                            ),

                            //  SizedBox(width: 5.w),
                          ],
                        ),
                        //Cart for User(Send & request)

                        width: 600.w,
                        height: 95.h,
                        margin: EdgeInsets.only(
                            left: 5.w, top: 5.h, right: 5.w, bottom: 5.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
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

                floatingActionButton: !flag2 && widget.num == "2"
                    ? Consumer<Formap>(builder: (context, formap, child) {
                        print(widget.num);
                        print("ssssssssssss");
                        return FloatingActionButton(
                          backgroundColor: Colors.green,
                          onPressed: () async => {
                            print(formap.lat),
                            // print(args),
                            flag1 = true,

                            await getCoordinates(args['lat']!, args['log']!),
                          },
                          child: const Icon(
                            Icons.route,
                            color: Colors.black,
                          ),
                        );
                      })
                    : null,

                // floatingActionButtonLocation:FloatingActionButtonLocation.miniStartTop,
              )
            : Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()),
              ));
  }
}
