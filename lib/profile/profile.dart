import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/model/profile.dart';
import 'package:shoppingo/myPurchases/Purchases.dart';
import 'package:shoppingo/profile/statistics.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporrary = File(image.path);
      setState(() {
        this.image = imageTemporrary;
      });
    } on PlatformException catch (e) {
      print("Failed To Pick Image");
    }
  }

  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;
  var name, oldPassword, newPassword, Storename, Storeadddress;

  int i = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var model = Provider.of<profile_model>(context);
    if (i == 0) {
      model.getAllInfoUser(context);
      i++;
    }
    _controller = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();

    _controller.text =
        model.infoUser != null && model.infoUser['fullName'] != null
            ? model.infoUser['fullName']
            : '';
    _controller2.text =
        model.infoUser != null && model.infoUser['email'] != null
            ? model.infoUser['email']
            : '';
    _controller3.text =
        model.infoSeller != null && model.infoSeller['storeName'] != null
            ? model.infoSeller['storeName']
            : '';
    _controller4.text =
        model.infoSeller != null && model.infoSeller['location'] != null
            ? model.infoSeller['location']
            : '';
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => profile_model(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ملفي الشخصي"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.03),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              //pic
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.02, bottom: height * 0.03),
                child: Center(
                  child: Center(
                      child: Stack(children: [
                    ClipOval(
                      child: image != null
                          ? Image.file(
                              File(image!.path),
                              width: width * 0.4,
                              height: height * 0.25,
                              fit: BoxFit.cover,
                            )
                          : (model.infoUser != null &&
                                  model.infoUser['imgURL'].isNotEmpty)
                              ? model.Tab == 1
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          model.infoUser['imgURL']),
                                      radius: width * 0.2,
                                    )
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          model.infoSeller['storeImageURL']),
                                      radius: width * 0.2,
                                    )
                              : Container(),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                              width: width * 0.15,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(2, 4),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: width * 0.01, color: Colors.white),
                                color: Color.fromARGB(250, 203, 59, 62),
                              ),
                              child:
                                  Icon(Icons.camera_alt, color: Colors.white))),
                    ),
                  ])),
                ),
              )
              //tow buttons
              ,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
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
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return statistics();
                              },
                            ));
                      },
                      child: Text(
                        "إحصائياتي",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  ElevatedButton(
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
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return Purchases();
                              },
                            ));
                      },
                      child: Text(
                        "مشترياتي",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.4,
                child: model.infoUser != null &&
                        model.infoUser['role'] != null &&
                        model.infoUser['role'] == "seller"
                    ? DefaultTabController(
                        initialIndex: 1,
                        length: 2,
                        child: Column(
                          children: [
                            TabBar(
                                onTap: (value) {
                                  model.changeTab(value);
                                  print(model.Tab);
                                },
                                labelColor: Color.fromARGB(250, 203, 59, 62),
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: "معلومات المتجر"),
                                  Tab(text: "معلوماتي الشخصية")
                                ]),
                            SizedBox(height: height * 0.03),
                            Expanded(
                                flex: 4,
                                child: Container(
                                    child: TabBarView(children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          "اسم متجري",
                                          style: TextStyle(
                                              fontSize: width * 0.055),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.03),
                                                child: Consumer<profile_model>(
                                                  builder:
                                                      (context, model, child) {
                                                    return InkWell(
                                                      child: Text("تعديل"),
                                                      onTap: () {
                                                        model.changeStore();
                                                      },
                                                    );
                                                  },
                                                )),
                                            Container(
                                                width: width * 0.7,
                                                child: Consumer<profile_model>(
                                                  builder:
                                                      (context, model, child) {
                                                    return TextFormField(
                                                      onChanged: (value) {
                                                        Storename = value;
                                                      },
                                                      textAlign: TextAlign.end,
                                                      initialValue:
                                                          _controller3.text,
                                                      enabled: model.editStore,
                                                    );
                                                  },
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "عنوان متجري",
                                          style: TextStyle(
                                              fontSize: width * 0.055),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.03),
                                                child: Consumer<profile_model>(
                                                  builder:
                                                      (context, model, child) {
                                                    return InkWell(
                                                      child: Text("تعديل"),
                                                      onTap: () {
                                                        model.changeAddress();
                                                      },
                                                    );
                                                  },
                                                )),
                                            Container(
                                                width: width * 0.7,
                                                child: Consumer<profile_model>(
                                                  builder:
                                                      (context, model, child) {
                                                    return TextFormField(
                                                      onChanged: (value) {
                                                        Storeadddress = value;
                                                      },
                                                      textAlign: TextAlign.end,
                                                      initialValue:
                                                          _controller4.text,
                                                      enabled:
                                                          model.editAddress,
                                                    );
                                                  },
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.04,
                                        ),
                                        Text(
                                          "الدفع",
                                          style: TextStyle(
                                              fontSize: width * 0.055),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                                width: width * 0.45,
                                                child: Consumer<profile_model>(
                                                  builder:
                                                      (context, model, child) {
                                                    return CheckboxListTile(
                                                      title: Text(
                                                          " عن طريق  \n  we pay "),
                                                      value: model.wePay,
                                                      selected: model.wePay,
                                                      onChanged: (value) {
                                                        model.checkRadioButton(
                                                            value);
                                                      },
                                                    );
                                                  },
                                                )),
                                            Container(
                                              width: width * 0.45,
                                              child: Consumer<profile_model>(
                                                builder:
                                                    (context, model, child) {
                                                  return CheckboxListTile(
                                                    selected: model.delevary,
                                                    title: Text("عند التسليم "),
                                                    value: model.delevary,
                                                    onChanged: (value) {
                                                      model.checkRadioButton2(
                                                          value);
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.04,
                                        ),
                                        Consumer<profile_model>(
                                          builder: (context, value, child) {
                                            return value.wePay
                                                ? Text(
                                                    "wePay كود حسابي على ",
                                                    style: TextStyle(
                                                        fontSize:
                                                            width * 0.055),
                                                  )
                                                : Text("");
                                          },
                                        ),
                                        Consumer<profile_model>(
                                          builder: (context, value, child) {
                                            return value.wePay
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height *
                                                                      0.03),
                                                          child: Consumer<
                                                              profile_model>(
                                                            builder: (context,
                                                                model, child) {
                                                              return InkWell(
                                                                child: Text(
                                                                    "تعديل"),
                                                                onTap: () {
                                                                  model
                                                                      .changeCode();
                                                                },
                                                              );
                                                            },
                                                          )),
                                                      Container(
                                                          width: width * 0.7,
                                                          child: Consumer<
                                                              profile_model>(
                                                            builder: (context,
                                                                model, child) {
                                                              return TextFormField(
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                initialValue:
                                                                    "123456789 ",
                                                                enabled: model
                                                                    .editCode,
                                                              );
                                                            },
                                                          )),
                                                    ],
                                                  )
                                                : Text("");
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          "اسمي",
                                          style: TextStyle(
                                              fontSize: width * 0.055),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.03),
                                                child: Consumer<profile_model>(
                                                  builder:
                                                      (context, model, child) {
                                                    return InkWell(
                                                      child: Text("تعديل"),
                                                      onTap: () {
                                                        model.changeName();
                                                      },
                                                    );
                                                  },
                                                )),
                                            Container(
                                                width: width * 0.7,
                                                child: Consumer<profile_model>(
                                                  builder:
                                                      (context, model, child) {
                                                    return Builder(
                                                        builder: (context) {
                                                      return TextFormField(
                                                        onChanged: (value) {
                                                          name = value;
                                                        },
                                                        textAlign:
                                                            TextAlign.end,
                                                        initialValue:
                                                            _controller.text !=
                                                                    null
                                                                ? _controller
                                                                    .text
                                                                : null,
                                                        enabled: model.editName,
                                                      );
                                                    });
                                                  },
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "إيميلي",
                                          style: TextStyle(
                                              fontSize: width * 0.055),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                width: width * 0.7,
                                                child: Consumer<profile_model>(
                                                  builder:
                                                      (context, model, child) {
                                                    return TextFormField(
                                                      initialValue:
                                                          _controller2.text,
                                                      textAlign: TextAlign.end,
                                                      enabled: model.editEmail,
                                                    );
                                                  },
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "ادخل كلمة المرور القديمة",
                                          style: TextStyle(
                                              fontSize: width * 0.055),
                                        ),
                                        Container(
                                            width: width * 0.7,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                oldPassword = value;
                                              },
                                              textAlign: TextAlign.end,
                                            )),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "ادخل كلمة المرور الجديدة",
                                          style: TextStyle(
                                              fontSize: width * 0.055),
                                        ),
                                        Container(
                                            width: width * 0.7,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                newPassword = value;
                                              },
                                              textAlign: TextAlign.end,
                                            )),
                                      ],
                                    ),
                                  )
                                ])))
                          ],
                        ))
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "اسمي",
                              style: TextStyle(fontSize: width * 0.055),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.03),
                                    child: Consumer<profile_model>(
                                      builder: (context, model, child) {
                                        return InkWell(
                                          child: Text("تعديل"),
                                          onTap: () {
                                            model.changeName();
                                          },
                                        );
                                      },
                                    )),
                                Container(
                                    width: width * 0.7,
                                    child: Consumer<profile_model>(
                                      builder: (context, model, child) {
                                        return TextFormField(
                                          onChanged: (value) {
                                            name = value;
                                          },
                                          textAlign: TextAlign.end,
                                          controller: _controller != null
                                              ? _controller
                                              : null,
                                          enabled: model.editName,
                                        );
                                      },
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              "إيميلي",
                              style: TextStyle(fontSize: width * 0.055),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    width: width * 0.7,
                                    child: Consumer<profile_model>(
                                      builder: (context, model, child) {
                                        return TextFormField(
                                          controller: _controller2,
                                          textAlign: TextAlign.end,
                                          enabled: model.editEmail,
                                        );
                                      },
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              "ادخل كلمة المرور القديمة",
                              style: TextStyle(fontSize: width * 0.055),
                            ),
                            Container(
                                width: width * 0.7,
                                child: TextFormField(
                                  onChanged: (value) {
                                    oldPassword = value;
                                  },
                                  textAlign: TextAlign.end,
                                )),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              "ادخل كلمة المرور القديمة",
                              style: TextStyle(fontSize: width * 0.055),
                            ),
                            Container(
                                width: width * 0.7,
                                child: TextFormField(
                                  onChanged: (value) {
                                    newPassword = value;
                                  },
                                  textAlign: TextAlign.end,
                                )),
                          ],
                        ),
                      ),
              ),

              ElevatedButton(
                  onPressed: () {
                    print(_controller.text);
                    print(name);
                    if (name == null) name = _controller.text;
                    if (Storename == null) Storename = _controller3.text;
                    if (Storeadddress == null)
                      Storeadddress = _controller4.text;
                    if (oldPassword != null) {
                      model.updateUserinfo(name, Storename, Storeadddress,
                          oldPassword, newPassword, image?.path, context);
                    } else {
                      var Snack = SnackBar(
                          content: Text("ادخل كلمة المرور القديمة الخاصة بك"));
                      ScaffoldMessenger.of(context).showSnackBar(Snack);
                    }
                  },
                  child: Text("إرسال"))
            ]),
          ),
        ),
      ),
    );
  }
}
