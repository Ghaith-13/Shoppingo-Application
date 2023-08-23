import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/model/auth.dart';

class ForgetPass extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  ForgetPass({super.key});

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final focus = FocusNode();
    bool flag = false;
    String answer = "";

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ForgetPass_model()),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: ListView(
              children: [
                Image.asset(
                  "assets/Sign_up.png",
                  height: height * 0.5,
                ),
                SingleChildScrollView(
                  reverse: true,
                  child: Container(
                    height: height * 0.5,
                    width: width,
                    padding: EdgeInsets.all(width * 0.03),
                    decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 2,
                          color: const Color.fromARGB(255, 203, 59, 62)),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.03, horizontal: width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "نسيت كلمة المرور",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 17, 29, 74),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Consumer<ForgetPass_model>(
                              builder: (context, visible, child) {
                            return !visible.vis
                                ? Form(
                                    key: formKey,
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
                                        hintText: "ادخل الإيميل",
                                        suffixIcon: const Icon(Icons.email),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(width: width * 0.01),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty || value == null) {
                                          return 'البريد الالكتروني فارغ';
                                        } else if (!RegExp(
                                                r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                            .hasMatch(value)) {
                                          return 'البريد الالكتروني غير صحيح';
                                        }
                                        {
                                          return null;
                                        }
                                      },
                                    ),
                                  )
                                : Consumer<ForgetPass_model>(
                                    builder: (context, visible1, child) {
                                    return !visible1.vis1
                                        ? Column(children: [
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            Center(
                                              child: Text(
                                                "ادخل الكود المرسل عبر إيميلك",
                                                style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 17, 29, 74),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            // Verify Code Input
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.03,
                                                    left: width * 0.03),
                                                child:
                                                    Consumer<ForgetPass_model>(
                                                  builder:
                                                      (context, model, child) {
                                                    return Form(
                                                        child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: height * 0.1,
                                                          width: width * 0.1,
                                                          child: TextFormField(
                                                            showCursor: true,
                                                            onSaved: (value) {},
                                                            onChanged: (value) {
                                                              model.varify1 =
                                                                  value;
                                                              if (value
                                                                      .length ==
                                                                  1) {
                                                                FocusScope.of(
                                                                        context)
                                                                    .nextFocus();
                                                              }
                                                            },
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline6,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            textAlign: TextAlign
                                                                .center,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  1),
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "الحقل فارغ";
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.1,
                                                          width: width * 0.1,
                                                          child: TextFormField(
                                                            onChanged: (value) {
                                                              model.varify2 =
                                                                  value;
                                                              if (value
                                                                      .length ==
                                                                  1) {
                                                                FocusScope.of(
                                                                        context)
                                                                    .nextFocus();
                                                              }
                                                            },
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline6,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            textAlign: TextAlign
                                                                .center,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  1),
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "الحقل فارغ";
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.1,
                                                          width: width * 0.1,
                                                          child: TextFormField(
                                                            onChanged: (value) {
                                                              model.varify3 =
                                                                  value;
                                                              if (value
                                                                      .length ==
                                                                  1) {
                                                                FocusScope.of(
                                                                        context)
                                                                    .nextFocus();
                                                              }
                                                            },
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline6,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            textAlign: TextAlign
                                                                .center,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  1),
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.1,
                                                          width: width * 0.1,
                                                          child: TextFormField(
                                                            onChanged: (value) {
                                                              model.varify4 =
                                                                  value;
                                                              flag = true;
                                                            },
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline6,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            textAlign: TextAlign
                                                                .center,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  1),
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "الحقل فارغ";
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ));
                                                  },
                                                )),
                                          ])
                                        : Text("");
                                  });
                          }),
                          Consumer<ForgetPass_model>(
                              builder: (context, visible1, child) {
                            return visible1.vis1
                                ? Form(
                                    key: formKey,
                                    child: Column(children: [
                                      Consumer<ForgetPass_model>(
                                        builder: (context, model, child) {
                                          return TextFormField(
                                            obscureText: model.press,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            textInputAction:
                                                TextInputAction.done,
                                            decoration: InputDecoration(
                                              hintText:
                                                  "ادخل كلمة المرور الجديدة",
                                              suffixIcon:
                                                  const Icon(Icons.lock),
                                              prefixIcon: IconButton(
                                                  onPressed: () {
                                                    model.changeIcon();
                                                  },
                                                  icon: model.eye),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: width * 0.01),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  value == null) {
                                                return 'كلمة المرور غير مدخلة';
                                              } else if (value.length < 8) {
                                                return 'طول كلمة المرور أٌقل من 8 محارف';
                                              } else {
                                                return null;
                                              }
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Consumer<ForgetPass_model>(
                                        builder: (context, value, child) {
                                          return TextFormField(
                                            obscureText: value.press2,
                                            keyboardType: TextInputType.name,
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            textInputAction:
                                                TextInputAction.done,
                                            decoration: InputDecoration(
                                              hintText:
                                                  "اعد إدخال كلمة المرور الجديدة ",
                                              suffixIcon:
                                                  const Icon(Icons.lock),
                                              prefixIcon: IconButton(
                                                  onPressed: () {
                                                    value.changeIcon2();
                                                  },
                                                  icon: value.eye2),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: width * 0.01),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  value == null) {
                                                return 'كلمة المرور غير مدخلة';
                                              } else if (value.length < 8) {
                                                return 'طول كلمة المرور أٌقل من 8 محارف';
                                              } else if (value !=
                                                  controller.text) {
                                                return "غير متطابقة مع كلمة المرور";
                                              }
                                              {
                                                return null;
                                              }
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                    ]),
                                  )
                                : Text("");
                          }),
                          Consumer<ForgetPass_model>(
                              builder: (context, visible, child) {
                            return !visible.vis
                                ? Center(
                                    child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text("أرسل الكود"),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        visible.changeVis();

                                        // Navigator.of(context)
                                        //     .pushReplacementNamed("checkCode");
                                      }
                                    },
                                  ))
                                : Consumer<ForgetPass_model>(
                                    builder: (context, visible1, child) {
                                    return !visible1.vis1
                                        ? Center(
                                            child: Consumer<ForgetPass_model>(
                                            builder: (context, model, child) {
                                              return ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.white,
                                                  ),
                                                  child:
                                                      const Text("تأكيد الكود"),
                                                  onPressed: () {
                                                    print(model.verifyCode());
                                                    model.verifyCode()
                                                        ? {
                                                            visible1
                                                                .changeVis1(),
                                                            print(visible1.vis1)
                                                          }
                                                        : {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    content: Text(
                                                                        "يجب إدخال الكود المرسل عبر إيميلك"))),
                                                          };
                                                  });
                                            },
                                          ))
                                        : Center(
                                            child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                            ),
                                            child:
                                                const Text("تأكيد كلمة السر"),
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                // visible.changeVis();

                                                // Navigator.of(context)
                                                //     .pushReplacementNamed("checkCode");
                                              }
                                            },
                                          ));
                                    ;
                                  });
                          }),
                        ],
                      ),
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
