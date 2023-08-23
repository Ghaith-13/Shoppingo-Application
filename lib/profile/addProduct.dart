import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/model/profile.dart';

var style, type;

class addProduct extends StatelessWidget {
  const addProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var model = Provider.of<addProduct_model>(context);

    //parameter for http
    return Scaffold(
      appBar: AppBar(),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => addProduct_model(),
          )
        ],
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": نمط الألبسة",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
                Consumer<addProduct_model>(
                  builder: (context, model, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<addProduct_model>(
                          builder: (context, model, child) {
                            if (model.male) {
                              return DropdownButton<String>(
                                value: model.dropdownValueForMale,
                                items: <String>[
                                  'جاكيت',
                                  'طقم',
                                  'بنطال',
                                  'قميص',
                                  'كنزة',
                                  'حزام',
                                  'ملابس سباحة',
                                  'شورت',
                                  'بجامة',
                                  'هوديز',
                                  'قبعة',
                                  'وشاح',
                                  'ربطة عنق',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: width * 0.06),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  model.changeDropDown1(newValue);
                                  type = newValue;
                                },
                              );
                            } else {
                              return DropdownButton<String>(
                                value: model.dropdownValueForFemale,
                                items: <String>[
                                  'فستان',
                                  'جاكيت',
                                  'طقم',
                                  'بنطال',
                                  'قميص',
                                  'كنزة',
                                  'حزام',
                                  'ملابس سباحة',
                                  'تنورة',
                                  'شورت',
                                  'بجامة',
                                  'هوديز',
                                  'قبعة',
                                  'وشاح',
                                  'ربطة عنق',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: width * 0.06),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  model.changeDropDown2(newValue);
                                },
                              );
                            }
                          },
                        ),
                        Column(
                          children: [
                            Container(
                              width: width * 0.39,
                              child: RadioListTile(
                                selected: model.male,
                                title: Text("رجل"),
                                value: "male",
                                groupValue: model.gender,
                                onChanged: (value) {
                                  model.changeSelect(value);
                                },
                              ),
                            ),
                            Container(
                              width: width * 0.39,
                              child: RadioListTile(
                                selected: model.female,
                                title: Text("أنثى"),
                                value: "female",
                                groupValue: model.gender,
                                onChanged: (value) {
                                  model.changeSelect(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),

                ////////////////////////////////////////

                SizedBox(
                  height: height * 0.03,
                ),
                Divider(),
                SizedBox(
                  height: height * 0.03,
                ),
                ///////////////////////////////////

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<addProduct_model>(
                      builder: (context, model, child) {
                        return DropdownButton<String>(
                          value: model.dropdownValueForType,
                          items: <String>[
                            'رياضي',
                            'سهرة',
                            'رسمي',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: width * 0.06),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            model.changeDropDownForType(newValue);
                            style = newValue;
                          },
                        );
                      },
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        ": نوع الألبسة ",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ////////////////////////////////////////

                SizedBox(
                  height: height * 0.03,
                ),
                Divider(),
                SizedBox(
                  height: height * 0.03,
                ),
                ///////////////////////////////////
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": الوصف ",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    model.description = value;
                  },
                  maxLines: 5,
                  minLines: 5,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: width * 0.001,
                          color: Color.fromARGB(250, 203, 59, 62)),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  ),
                ),
                ////////////////////////////////////////

                SizedBox(
                  height: height * 0.03,
                ),
                Divider(),
                SizedBox(
                  height: height * 0.03,
                ),
                ///////////////////////////////////
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": اسم الماركة ",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    model.brand = value;
                  },
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: width * 0.001,
                          color: Color.fromARGB(250, 203, 59, 62)),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  ),
                ),
                ////////////////////////////////////////

                SizedBox(
                  height: height * 0.03,
                ),
                Divider(),
                SizedBox(
                  height: height * 0.03,
                ),
                ///////////////////////////////////
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": رقم الموديل  ",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    model.modelNumber = value;
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: width * 0.001,
                          color: Color.fromARGB(250, 203, 59, 62)),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  ),
                ),
                ////////////////////////////////////////

                SizedBox(
                  height: height * 0.03,
                ),
                Divider(),
                SizedBox(
                  height: height * 0.03,
                ),
                ///////////////////////////////////
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": السعر",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    model.price = value;
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: width * 0.001,
                          color: Color.fromARGB(250, 203, 59, 62)),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  ),
                ),
                ////////////////////////////////////////

                SizedBox(
                  height: height * 0.03,
                ),
                Divider(),
                SizedBox(
                  height: height * 0.03,
                ),
                ///////////////////////////////////
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.004),
                        child: Text(
                          "(غير ضروري)",
                          style: TextStyle(
                              color: Color.fromARGB(255, 17, 29, 74),
                              fontSize: width * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ": السعر بعد الحسم",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    model.fixedDiscount = value;
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: width * 0.001,
                          color: Color.fromARGB(250, 203, 59, 62)),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  ),
                ),
                ////////////////////////////////////////

                SizedBox(
                  height: height * 0.03,
                ),
                Divider(),
                SizedBox(
                  height: height * 0.03,
                ),
                ///////////////////////////////////
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": القياسات + الألوان + الكمية",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
                Consumer<addProduct_model>(
                  builder: (context, model, child) {
                    return Container(
                      width: width * 0.5,
                      child: DropDownMultiSelect(
                        whenEmpty: 'اختر القياسات الموجودة',
                        options: model.Sizes,
                        selectedValues: model.selectedSizes,
                        onChanged: (value) {
                          model.changeDropdownMultiSelected(value);
                          print("/////");
                          print(value);
                          print("/////");
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Consumer<addProduct_model>(
                  builder: (context, value, child) {
                    if (value.sizesContainer) {
                      return Container(
                        height: height * 0.5,
                        child: Scrollbar(
                          child: ListView.builder(
                            itemCount: value.selectedSizes.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 0.015),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Consumer<addProduct_model>(
                                            builder: (context, value, child) {
                                              if (value.ColorSelected[index] ==
                                                  0) {
                                                return Container(
                                                  width: width * 0.6,
                                                  height: height * 0.4,
                                                );
                                              } else {
                                                return Container(
                                                  width: 0,
                                                  height: 0,
                                                );
                                              }
                                            },
                                          ),
                                          Consumer<addProduct_model>(
                                            builder: (context, value, child) {
                                              if (value.ColorSelected[index] ==
                                                  0) {
                                                return Positioned(
                                                  top: height * 0.03,
                                                  child: Container(
                                                    width: width * 0.6,
                                                    height: height * 0.35,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: const <
                                                          BoxShadow>[
                                                        BoxShadow(
                                                          color:
                                                              Color(0x73000000),
                                                          blurRadius: 5.0,
                                                          spreadRadius: 1,
                                                          offset:
                                                              Offset(-5.0, 0.0),
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              width * 0.03),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  height * 0.05,
                                                              horizontal:
                                                                  width * 0.02),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      value.increase(
                                                                          index);
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .add_circle,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          17,
                                                                          29,
                                                                          74),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      value.decrese(
                                                                          index);
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .remove_circle,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          17,
                                                                          29,
                                                                          74),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                  '${value.numberOfProduct[index]}'),
                                                              Text(
                                                                ": الكمية",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        width *
                                                                            0.04),
                                                              ),
                                                            ],
                                                          ),
                                                          const Divider(),
                                                          Consumer<
                                                              addProduct_model>(
                                                            builder: (context,
                                                                value, child) {
                                                              return ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        17,
                                                                        29,
                                                                        74), // Set the button's background color
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    value.showColorPicker(
                                                                        index);
                                                                  },
                                                                  child: const Text(
                                                                      "إضافة لون"));
                                                            },
                                                          ),
                                                          Consumer<
                                                              addProduct_model>(
                                                            builder: (context,
                                                                value, child) {
                                                              return Container(
                                                                width:
                                                                    width * 0.6,
                                                                height: height *
                                                                    0.14,
                                                                child: GridView
                                                                    .builder(
                                                                  gridDelegate:
                                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        3, // number of containers in each row
                                                                  ),
                                                                  itemBuilder:
                                                                      (context,
                                                                          index2) {
                                                                    return Stack(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(width * 0.03),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: value.Colors[index][index2],
                                                                              borderRadius: BorderRadius.circular(width * 0.2),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Positioned(
                                                                            right: width *
                                                                                0.02,
                                                                            top: height *
                                                                                0.01,
                                                                            child:
                                                                                Consumer<addProduct_model>(
                                                                              builder: (context, value, child) {
                                                                                return InkWell(
                                                                                  onTap: () {
                                                                                    value.removeColor(index, value.Colors[index][index2]);
                                                                                  },
                                                                                  child: Container(
                                                                                    width: width * 0.06,
                                                                                    height: height * 0.025,
                                                                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                                                                    child: Icon(
                                                                                      Icons.cancel,
                                                                                      size: width * 0.05,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ))
                                                                      ],
                                                                    );
                                                                  },
                                                                  itemCount: value
                                                                      .Colors[
                                                                          index]
                                                                      .length, // total number of containers
                                                                ),
                                                              );
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  width: 0,
                                                  height: 0,
                                                );
                                              }
                                            },
                                          ),
                                          Consumer<addProduct_model>(
                                            builder: (context, value, child) {
                                              if (value.ColorSelected[index] ==
                                                  0) {
                                                return Positioned(
                                                  left: width * 0.21,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 5,
                                                            color: Colors.black,
                                                            spreadRadius: 0.1)
                                                      ],
                                                    ),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 17, 29, 74),
                                                      radius: width * 0.08,
                                                      child: Text(
                                                        value.selectedSizes[
                                                            index],
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  width: 0,
                                                  height: 0,
                                                );
                                              }
                                            },
                                          ),
                                          Consumer<addProduct_model>(
                                            builder: (context, value, child) {
                                              if (value.ColorSelected[index] ==
                                                  1) {
                                                return Container(
                                                  width: width * 0.7,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        color:
                                                            Color(0x73000000),
                                                        blurRadius: 5.0,
                                                        spreadRadius: 2,
                                                        offset:
                                                            Offset(-5.0, 0.0),
                                                      ),
                                                    ],
                                                  ),
                                                  child: ColorPicker(
                                                    pickerColor:
                                                        value.primarycolor,
                                                    onColorChanged:
                                                        (Color color) {
                                                      value.changeColorPicker(
                                                          color);
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  width: 0,
                                                  height: 0,
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                      Consumer<addProduct_model>(
                                        builder: (context, value, child) {
                                          if (value.ColorSelected[index] == 1) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    value
                                                        .hideColorPicker(index);
                                                  },
                                                  child: const Text("إلغاء"),
                                                ),
                                                SizedBox(
                                                  width: width * 0.05,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    value.addColorPicker(index);
                                                  },
                                                  child: const Text("تأكيد"),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Container(
                                              width: 0,
                                              height: 0,
                                            );
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: 0,
                        height: 0,
                      );
                    }
                  },
                ),
                Text(
                  "صور المنتج",
                  style: TextStyle(
                      fontSize: width * 0.05, fontWeight: FontWeight.bold),
                ),
                Consumer<addProduct_model>(
                  builder: (context, value, child) {
                    return Center(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: width * 0.6,
                                  height: height * 0.42,
                                ),
                                value.image != null
                                    ? Positioned(
                                        left: width * 0.05,
                                        top: height * 0.01,
                                        child: Container(
                                            child: Image.file(
                                                width: width * 0.55,
                                                height: height * 0.4,
                                                fit: BoxFit.cover,
                                                File(value.image!.path))),
                                      )
                                    : Positioned(
                                        left: width * 0.05,
                                        top: height * 0.01,
                                        child: Container(
                                          width: width * 0.55,
                                          height: height * 0.4,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/product.jfif',
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: InkWell(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: width * 0.05,
                                          child: Icon(
                                            Icons.camera_alt_rounded,
                                            size: width * 0.06,
                                            color:
                                                Color.fromARGB(255, 17, 29, 74),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        value.pickImage();
                                      },
                                    )),
                              ],
                            ),
                          ),
                          Text(
                            "صورة أمامية للمنتج",
                            style: TextStyle(
                              fontSize: width * 0.05,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Divider(),
                Consumer<addProduct_model>(
                  builder: (context, value, child) {
                    return Center(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: width * 0.6,
                                  height: height * 0.42,
                                ),
                                value.image2 != null
                                    ? Positioned(
                                        left: width * 0.05,
                                        top: height * 0.01,
                                        child: Container(
                                            child: Image.file(
                                                width: width * 0.55,
                                                height: height * 0.4,
                                                fit: BoxFit.cover,
                                                File(value.image2!.path))),
                                      )
                                    : Positioned(
                                        left: width * 0.05,
                                        top: height * 0.01,
                                        child: Container(
                                          width: width * 0.55,
                                          height: height * 0.4,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/product.jfif',
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: InkWell(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: width * 0.05,
                                          child: Icon(
                                            Icons.camera_alt_rounded,
                                            size: width * 0.06,
                                            color:
                                                Color.fromARGB(255, 17, 29, 74),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        value.pickImage2();
                                      },
                                    )),
                              ],
                            ),
                          ),
                          Text(
                            "صورة خلفية للمنتج",
                            style: TextStyle(
                              fontSize: width * 0.05,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Consumer<addProduct_model>(
                  builder: (context, value, child) {
                    return Padding(
                      padding: EdgeInsets.only(top: height * 0.1),
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                List<Map<String, dynamic>> array = [];

                                // int minLength = Colors2.length < numberOfProduct.length
                                //     ? Colors2.length
                                //     : numberOfProduct.length;

                                for (int i = 0;
                                    i < value.selectedSizes.length;
                                    i++) {
                                  Map<String, dynamic> object = {
                                    'size': value.selectedSizes[i],
                                    'colors': value.Colors2[i],
                                    'quantity': value.numberOfProduct[i]
                                  };
                                  array.add(object);
                                }
                                print("ghaith");
                                print(type);
                                print("ghaith");
                                String variations = jsonEncode(array);
                                print(value.image!.path);
                                print(value.image2!.path);
                                var frontImgURL = value.image!.path;
                                var backImgURL = value.image2!.path;
                                model.sendData(type, style, variations,
                                    frontImgURL, backImgURL, context);
                              },
                              child: Text("إضافة المنتج"))),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
