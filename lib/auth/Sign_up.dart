import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/auth/Log_in.dart';
import 'package:shoppingo/model/auth.dart';

class SIGNINING extends StatelessWidget {
  const SIGNINING({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Sign_up_model()),
    ], child: Sign_up());
  }
}

class Sign_up extends StatelessWidget {
  Sign_up({super.key});
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final _passwordController = TextEditingController();
  var firstName,
      middleName,
      lastName,
      username,
      email,
      phonenumber,
      password,
      pin,
      fullName;
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Sign_up_model>(context);

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // reverse:true,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/Sign_up.png",
                  height: height * 0.47,
                ),
              ),
              Positioned(
                top: height * 0.42,
                child: Container(
                  height: height / 1.8,
                  width: width,
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
                        vertical: height * 0.02, horizontal: width * 0.02),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        reverse: true,
                        child: Column(
                          //  mainAxisAlignment:MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "سجل حسابك الآن ",
                              style: TextStyle(
                                  fontSize: width * 0.056,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 17, 29, 74)),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                hintText: "ادخل الاسم",
                                suffixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: width * 0.01),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return 'الاسم فارغ';
                                } else if (!RegExp(r'^[ا-يa-z A-Z]+$')
                                    .hasMatch(value)) {
                                  return 'ادخل الاسم الصحيح (يحتوي محارف)';
                                } else if (value.trim().split(' ').length !=
                                    3) {
                                  return "ادخل الاسم الثلاثي الكامل";
                                } else {
                                  var split = value.trim().split(' ');
                                  fullName = value;
                                  firstName = split[0];
                                  middleName = split[1];
                                  lastName = split[2];
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextFormField(
                              controller: controller2,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                hintText: "ادخل الإيميل",
                                suffixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: width * 0.01),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return 'البريد الالكتروني فارغ';
                                } else if (!RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                    .hasMatch(value)) {
                                  return 'البريد الالكتروني غير صحيح';
                                } else {
                                  email = value;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Consumer<Sign_up_model>(
                              builder: (context, model, child) {
                                return TextFormField(
                                  controller: _passwordController,
                                  obscureText: model.press,
                                  keyboardType: TextInputType.visiblePassword,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "ادخل كلمة السر",
                                    suffixIcon: const Icon(Icons.lock),
                                    prefixIcon: IconButton(
                                        onPressed: () {
                                          model.changeIcon();
                                        },
                                        icon: model.eye),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(width: width * 0.01),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
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
                            Consumer<Sign_up_model>(
                              builder: (context, value, child) {
                                return TextFormField(
                                  controller: controller3,
                                  obscureText: value.press2,
                                  keyboardType: TextInputType.name,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "تأكيد كلمة السر ",
                                    suffixIcon: const Icon(Icons.lock),
                                    prefixIcon: IconButton(
                                        onPressed: () {
                                          value.changeIcon2();
                                        },
                                        icon: value.eye2),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(width: width * 0.01),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return 'كلمة المرور غير مدخلة';
                                    } else if (value.length < 8) {
                                      return 'طول كلمة المرور أٌقل من 8 محارف';
                                    } else if (value !=
                                        _passwordController.text) {
                                      return "غير متطابقة مع كلمة المرور";
                                    } else {
                                      password = value;
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          transitionDuration:
                                              const Duration(seconds: 1),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return ScaleTransition(
                                              alignment: Alignment.center,
                                              scale: animation,
                                              child: child,
                                            );
                                          },
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return LOGGING();
                                          },
                                        ));
                                  },
                                  child: const Text("سجل دخول"),
                                ),
                                const Text(
                                  " هل لديك حساب مسبقاً ؟",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: height * 0.39,
                  left: width * 0.14,
                  child: InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await model.fetchData(controller.text, controller2.text,
                            controller3.text, context);
                      }
                    },
                    child: Container(
                      width: width * 0.15,
                      height: height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 203, 59, 62)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: width * 0.09,
                      ),
                    ),
                  )),
              Positioned(
                  child: Container(
                width: width,
                height: height / 1.05,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
