import 'package:flutter/material.dart';
import 'package:mobile_appiontment/pages/register_page.dart';
import 'package:mobile_appiontment/pages/test_page.dart';
import 'package:mobile_appiontment/services/auth/auth_service.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../components/blob_animation.dart';
import '../components/fade_animation.dart';
import '../components/main_button.dart';
import '../components/main_input.dart';
// import '../providers/logged_in_user_provider.dart';
// import '../models/loggedIn_user_data.dart';
import '../models/loggedIn_user_data.dart';
import '../utils/theme.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  CustomAnimationControl control = CustomAnimationControl.stop;
  bool nextPage = false;
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  UserLoggedIn userRealData = UserLoggedIn();
  final AuthService authService = AuthService();
  //String token = '';

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();

    _passwordContoller.dispose();
  }

  // Future<void> checkIsLogin() async {
  //   String? _token = "";
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _token = prefs.getString("x-auth-token");
  //   if (_token != "" && _token != null) {
  //     setState(() {
  //       token = _token!;
  //     });

  //     //your home page is loaded
  //   } else {
  //     setState(() {
  //       token = "";
  //     });
  //   }
  // }

  String? validateUserName(String? val) {
    //<-- add String? as a return type
    if (val!.isEmpty) {
      return "اسم المستخدم مطلوب";
    }
    return null;
  }

  Future<void> mapUserLoggedInData() async {
    await authService.getUserDataFromToken();
    var uid = await authService.getUserRealData().then((value) => value.id!);
    var uname =
        await authService.getUserRealData().then((value) => value.userName!);
    var utoken =
        await authService.getUserRealData().then((value) => value.token!);

    var uroles =
        await authService.getUserRealData().then((value) => value.roles!);

    UserLoggedIn usrr = UserLoggedIn();
    usrr.id = uid;
    usrr.userName = uname;
    usrr.token = utoken;
    usrr.roles = uroles;

    // debugPrint("phone ${usrr.phoneNumber}");
    // debugPrint("id  ${usrr.id.toString()}");
    // debugPrint("uname ${usrr.userName}");
    // debugPrint("token ${usrr.token}");
    // debugPrint("roles => ${usrr.roles}");
    setState(() {
      userRealData = usrr;
    });
  }

  String? validatePassword(String? val) {
    //<-- add String? as a return type
    if (val!.isEmpty) {
      return "الرمز السري مطلوب";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 50));
    mapUserLoggedInData();
    Future.delayed(const Duration(microseconds: 50));
    userRealData.token = "";
    //checkIsLogin();
    //mapUserLoggedInData();
    // debugPrint("==> ${userRealData.token}");
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        control = CustomAnimationControl.play;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return userRealData.token!.isEmpty
        ? Scaffold(
            // resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                CustomAnimation<double?>(
                    control: control,
                    tween: Tween(begin: -400, end: -200), // define tween
                    duration: const Duration(seconds: 1), // define duration
                    curve: Curves.easeInOutCubic,
                    onComplete: () {
                      if (nextPage) {}
                    },
                    builder: (context, child, value) {
                      return Positioned(
                          top: value,
                          //تغيير موقع الانميشن الاعلى ايمن ام ايسر
                          left: -200,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              BlobAnimation(
                                  blobSize: 400,
                                  blobColor: ThemeApp().colors[0],
                                  animDuration: const Duration(seconds: 10)),
                              BlobAnimation(
                                  blobSize: 350,
                                  blobColor: ThemeApp().colors[1],
                                  animDuration: const Duration(seconds: 9))
                            ],
                          ));
                    }),
                FadeAnimation(
                    delay_: const Duration(milliseconds: 2500),
                    child_: Align(
                      alignment: Alignment.center,
                      child: Form(
                        key: _signInFormKey,
                        child: ListView(children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 150, left: 50, right: 50),
                            child: Text(
                              "تسجيل الدخول",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 50, right: 50),
                            child: MainInput(
                              hintText: "اسم المستخدم",
                              linesNo: 1,
                              minlinesNo: 1,
                              controller: _userNameController,
                              validator: validateUserName,
                              icon: const Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 34, left: 50, right: 50),
                            child: MainInput(
                              hintText: "كلمة المرور",
                              linesNo: 1,
                              minlinesNo: 1,
                              controller: _passwordContoller,
                              validator: validatePassword,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 50,
                              right: 50,
                            ),
                            child: MainButton(
                                text: "تسجيل الدخول",
                                onPressed: () async {
                                  debugPrint("clicked");
                                  debugPrint(_signInFormKey.currentState!
                                      .validate()
                                      .toString());
                                  if (!_signInFormKey.currentState!
                                      .validate()) {
                                    showTopSnackBar(
                                      context,
                                      const CustomSnackBar.error(
                                        backgroundColor: Color(0xffE3E7F1),
                                        message:
                                            "يرجى ادخال اسم المستخدم و رمز المرور الصحيح",
                                      ),
                                    );
                                  } else {
                                    // debugPrint("${userRealData.token} ==> token");
                                    await authService.logIn(
                                        context,
                                        _userNameController.text,
                                        _passwordContoller.text);
                                    //await authService.getUserDataFromToken();
                                    await mapUserLoggedInData();
                                    // debugPrint(userRealData.userName);

                                    // await Future.delayed(
                                    //     const Duration(milliseconds: 50));
                                    // mapUserLoggedInData();
                                    // await Future.delayed(
                                    //     const Duration(milliseconds: 50));
                                    // //  Future.delayed(const Duration(milliseconds: 50));
                                    // debugPrint("user real data");
                                    // debugPrint("uname => ${userRealData.userName}");
                                    // debugPrint("utoken => ${userRealData.token}");
                                    // debugPrint(
                                    //     "uid => ${userRealData.id.toString()}");
                                    // for (int i = 0;
                                    //     i < userRealData.roles!.length;
                                    //     i++) {
                                    //   debugPrint(
                                    //       "urole => ${userRealData.roles![i]}");
                                    // }
                                    // Future.delayed(const Duration(milliseconds: 100));
                                    // Future.delayed(const Duration(milliseconds: 50));
                                    // //   authService.getUserDataFromToken(context);
                                    // mapUserLoggedInData();

                                    // Future.delayed(const Duration(milliseconds: 50));
                                    // debugPrint(
                                    //     "username => ${userRealData.userName}");

                                    // debugPrint(
                                    //     "username => ${userRealData.id.toString()}");

                                    // debugPrint("username => ${userRealData.token}");

                                    // Future.delayed(const Duration(milliseconds: 50));
                                    if (userRealData.token!.isNotEmpty) {
                                      authService.loginRoute(context);
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => TestPage()),
                                      // );
                                    } else {
                                      showTopSnackBar(
                                        context,
                                        const CustomSnackBar.error(
                                          backgroundColor: Color(0xffE3E7F1),
                                          message: "حدثت مشكلة في تسجيل الدخول",
                                        ),
                                      );
                                    }
                                  }
                                  //  debugPrint(xx.toString());
                                  //setState(() {});
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 50,
                              right: 50,
                              bottom: 30,
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("ليس لديك حساب? ",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Listener(
                                    onPointerDown: (e) {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: const RegisterPage()));
                                    },
                                    // Navigator.push(
                                    //     context,
                                    //     PageTransition(
                                    //         type: PageTransitionType.rightToLeft,
                                    //         child: const RegisterPage()));
                                    //  },
                                    child: Text("تسجيل جديد",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ThemeApp().colors[0])),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  )
                                ]),
                          ),
                        ]),
                      ),
                    )),
                CustomAnimation<double?>(
                    control: control,
                    tween: Tween(begin: -200, end: 0), // define tween
                    duration: const Duration(seconds: 1), // define duration
                    curve: Curves.easeInOutCubic,
                    builder: (context, child, value) {
                      return Positioned(
                          bottom: value,
                          left: 0,
                          right: 0,
                          child: isKeyboardOpen == true
                              ? Container(
                                  height: 10,
                                  child: WaveWidget(
                                    config: CustomConfig(
                                      colors: ThemeApp().colors,
                                      durations: ThemeApp().durations,
                                      heightPercentages:
                                          ThemeApp().heightPercentages,
                                    ),
                                    size:
                                        Size(double.infinity, double.infinity),
                                    waveAmplitude: 0,
                                  ),
                                )
                              : Container(
                                  height: 80,
                                  child: WaveWidget(
                                    config: CustomConfig(
                                      colors: ThemeApp().colors,
                                      durations: ThemeApp().durations,
                                      heightPercentages:
                                          ThemeApp().heightPercentages,
                                    ),
                                    size:
                                        Size(double.infinity, double.infinity),
                                    waveAmplitude: 0,
                                  ),
                                ));
                    })
              ],
            ),
          )
        : TestPage();
  }
}
