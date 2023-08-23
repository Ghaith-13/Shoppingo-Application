import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:shoppingo/model/profile.dart';
import 'package:shoppingo/profile/Bar-Chart-Method.dart';
import 'package:shoppingo/profile/addProduct.dart';

class statistics extends StatelessWidget {
  final List<BarChartModel> dataForYear = [
    BarChartModel(
        Year: "Jan",
        financial: 25000,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "Feb",
        financial: 25000,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "Mar",
        financial: 50000,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "April",
        financial: 500000,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "May",
        financial: 500000,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "Jun",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "Jul",
        financial: 150000,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "Aug",
        financial: 750000,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "Sep",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "Act",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "Nov",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "Dec",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
  ];
  final List<BarChartModel> dataForMonth = [
    BarChartModel(
        Year: "1",
        financial: 50000,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "2",
        financial: 25000,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "3",
        financial: 25000,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "4",
        financial: 200000,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "5",
        financial: 100000,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "6",
        financial: 25000,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "7",
        financial: 25000,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "8",
        financial: 50000,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "9",
        financial: 250000,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "10",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "11",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "12",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "13",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "14",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "15",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "16",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "17",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "18",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "19",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "20",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "21",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "22",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "23",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "24",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "25",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "26",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "27",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "28",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "29",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "30",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "31",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
  ];
  final List<BarChartModel> dataForDay = [
    BarChartModel(
        Year: "1",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "2",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "3",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "4",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "5",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "6",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "7",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "8",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "9",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "10",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "11",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "12",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "13",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "14",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "15",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "16",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "17",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "18",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "19",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "20",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "21",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "22",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
    BarChartModel(
        Year: "23",
        financial: 0,
        color:
            charts.ColorUtil.fromDartColor(Color.fromARGB(250, 203, 59, 62))),
    BarChartModel(
        Year: "24",
        financial: 0,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 17, 29, 74))),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: dataForYear,
        domainFn: (BarChartModel series, _) => series.Year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    List<charts.Series<BarChartModel, String>> series2 = [
      charts.Series(
        id: "financial",
        data: dataForMonth,
        domainFn: (BarChartModel series, _) => series.Year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    List<charts.Series<BarChartModel, String>> series3 = [
      charts.Series(
        id: "financial",
        data: dataForDay,
        domainFn: (BarChartModel series, _) => series.Year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => statistics_model(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("إحصائياتي"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //tow rectangles
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.07),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(250, 203, 59, 62),
                        Color.fromARGB(255, 17, 29, 74),
                      ],
                    ),
                  ),
                  width: width * 0.9,
                  height: height * 0.2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shoppingo الدخل الكلي من ",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.05),
                        ),
                        Text(
                          "20000000 SYP",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.05),
                        )
                      ],
                    ),
                  ),
                ),
                /////////////////////////////////
                SizedBox(
                  height: height * 0.02,
                ),
                /////////////////////////////////
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.07),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(250, 203, 59, 62),
                        Color.fromARGB(255, 17, 29, 74),
                      ],
                    ),
                  ),
                  width: width * 0.9,
                  height: height * 0.2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " عدد المستخدمين الذين اشتروا من منتجاتي   ",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.05),
                        ),
                        Text(
                          "900 مستخدم",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.05),
                        )
                      ],
                    ),
                  ),
                ),

                //end tow rectangles
                /////////////////////////////////
                SizedBox(
                  height: height * 0.02,
                ),
                /////////////////////////////////
                Divider(),

                /// /////////////////////////////////
                SizedBox(
                  height: height * 0.02,
                ),
                /////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<statistics_model>(
                      builder: (context, value, child) {
                        return DropdownButton(

                            // Initial Value
                            value: value.dropdownvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: value.items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              value.changeSelcted(newValue);
                            });
                      },
                    ),
                    Text(
                      ": تصنيف حسب ",
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                  ],
                ),

                ///BarChar
                Container(
                    width: width,
                    height: height * 0.4,
                    child: Consumer<statistics_model>(
                      builder: (context, value, child) {
                        if (value.OptionSelected == 0) {
                          return charts.BarChart(
                            series,
                            animate: true,
                          );
                        } else {
                          return charts.BarChart(
                            value.OptionSelected == 1 ? series2 : series3,
                            animate: true,
                            domainAxis: const charts.OrdinalAxisSpec(
                                renderSpec: charts.NoneRenderSpec()),
                          );
                        }
                      },
                    )),

                ///end BarChar
                ///  /////////////////////////////////
                SizedBox(
                  height: height * 0.02,
                ),
                /////////////////////////////////
                Divider(),

                /// /////////////////////////////////
                SizedBox(
                  height: height * 0.02,
                ),
                /////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: width * 0.4,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "طلباتي ",
                            ))),
                    Container(
                        width: width * 0.4,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 200),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return addProduct();
                                    },
                                  ));
                            },
                            child: const Text(
                              "إضافة منتج",
                            ))),
                  ],
                ),

                /// /////////////////////////////////
                SizedBox(
                  height: height * 0.02,
                ),
                /////////////////////////////////
                Text(
                  "منتجاتي",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 29, 74),
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold),
                ),

                /// /////////////////////////////////
                SizedBox(
                  height: height * 0.02,
                ),
                /////////////////////////////////
                Scrollbar(
                  child: Container(
                    width: width,
                    height: height * 0.78,
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.07),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width * 0.03),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            width: width * 0.2,
                            child: Column(
                              children: [
                                index % 2 == 0
                                    ? Container(
                                        color: Colors.black,
                                        width: width * 0.7,
                                        height: height * 0.3,
                                        child: Image.asset(
                                          "assets/1.jpg",
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Container(
                                        color: Colors.black,
                                        width: width * 0.7,
                                        height: height * 0.3,
                                        child: Image.asset(
                                          "assets/2.jpeg",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                index % 2 == 0
                                    ? Text("50000 SYP",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold))
                                    : Text("150000 SYP",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Divider(),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: width * 0.2,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: const Color.fromARGB(
                                                    255,
                                                    17,
                                                    29,
                                                    74), // Background color
                                                // Text Color (Foreground color)
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                " تعديل",
                                              ))),
                                      Container(
                                          width: width * 0.2,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: const Color.fromARGB(
                                                    255,
                                                    17,
                                                    29,
                                                    74), // Background color
                                                // Text Color (Foreground color)
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                "حذف ",
                                              ))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
