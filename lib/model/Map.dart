import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import "package:http/http.dart" as http;
import 'package:shoppingo/Sellers/ApIforMap.dart';
import 'package:shoppingo/model/Seller.dart';

class MapShow extends ChangeNotifier {
  double CurrentLat = 760.0;
  double CurrentLog = 0.0;
  bool flag = false;
  ChangeCurrentLocation() {}
  notifyListeners();
}

class LocationMap extends ChangeNotifier {
  double lati = 0.0;
  double logn = 0.0;
  bool flog = false;
  bool flog2 = false;
  double get positionlat => lati;
  double get positionlog => logn;
  late List total_distance = [];
  late List total_duration = [];
  late List total_distance1 = [];
  late List total_duration1 = [];
  late double EndLat = 1.0;
  late double EndLog = 1.0;
  List listOfPoints = [];
  List listOfPoints1 = [];
  List<LatLng> points = [];
  List listOfPoints2 = [];
  List listOfPoints22 = [];
  List<LatLng> points2 = [];
  double sum1 = 0.0, sum2 = 0.0, sum3 = 0.0, sum4 = 0.0;
  var r = [];

  var r1 = [];
  bool off = false;
  bool off1 = false;
  static List<Contacts> main_List = [
    Contacts("Rounia1\n", "./assets/13.jpg", "حمص", "0937082264", "صاغة"),
    Contacts("Rounia2\n", "./assets/13.jpg", "حمص", "0937082264", "صاغة"),
    Contacts("Rounia3\n", "./assets/13.jpg", "حمص", "0937082264", "صاغة"),
    Contacts("Rounia4\n", "./assets/13.jpg", "حلب", "0937082264", "بقالية"),
    Contacts("Rounia5\n", "./assets/13.jpg", "حلب", "0937082264", "بقالية"),
    Contacts("Rounia6\n", "./assets/13.jpg", "حلب", "0937082264", "بقالية"),
  ];
  List<Contacts> display_List = main_List;
  String countreyValue = 'حسب المحافظة';
  String categoryValue = 'حسب نوع المتجر';

  var countries = [
    'حسب المحافظة',
    'حمص',
    'حلب',
    'دمشق',
    'طرطوس',
    'اللاذقية',
    'حماة',
    'إدلب',
    'الرقة',
    'دير الزور',
  ];
  var categories = [
    'حسب نوع المتجر',
    'ألبسة',
    'أحذية',
    'مواد غذائية',
    'صاغة',
    'مواد تنظيف',
    'بقالية',
    'محمصة',
    'بالة',
  ];

  void getCurrent() async {
    await Geolocator.requestPermission();
    Position _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lati = _position.latitude;
    logn = _position.longitude;
    off = true;

    notifyListeners();
  }

  getCoordinates(ALLcoo, double x, double y) async {
    print(ALLcoo.length);
    total_duration = [];
    total_duration1 = [];
    total_distance = [];
    total_distance1 = [];
    for (int i = 0; i < ALLcoo.length; i++) {
      sum1 = 0;
      sum2 = 0;
      sum3 = 0;
      sum4 = 0;
      if (ALLcoo[i].length == 0) {
        total_distance.add(0);
        total_distance1.add(0);
        total_duration.add(0);
        total_duration1.add(0);
        continue;
      }
      var response = await http
          .get(getRouteUrl("${y},${x}", "${ALLcoo[i][0]},${ALLcoo[i][1]}"));
      var response1 = await http
          .get(getRouteUrl1("${y},${x}", "${ALLcoo[i][0]},${ALLcoo[i][1]}"));
      print(response.body);
      if (response.statusCode == 200) {
        print("yeeeeees");
        off1 = true;
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
          sum1 += element['distance'];
        });
        r.forEach((ele) {
          sum2 += ele['duration'];
        });

        r1 = data1['features'][0]['properties']['segments'][0]['steps'];

        listOfPoints2 = data['features'][0]['geometry']['coordinates'];
        listOfPoints22 =
            data['features'][0]['properties']['segments'][0]['steps'];
        points2 = listOfPoints2
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
        r1.forEach((element) {
          sum3 += element['distance'];
        });
        r1.forEach((ele) {
          sum4 += ele['duration'];
        });
        print(sum1);
        print(sum2);
        print(sum3);
        print(sum4);
        total_distance.add((sum1 / 1000).toInt());
        total_distance1.add((sum3 / 1000).toInt());
        total_duration1.add((sum4 ~/ 3600).toInt());
        total_duration.add(((sum2 % 3600) / 60).toInt());
      } else {
        total_distance.add(0);
        total_distance1.add(0);
        total_duration.add(0);
        total_duration1.add(0);
      }
    }
    print(total_distance.length);

    notifyListeners();
  }
}
