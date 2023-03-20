import 'package:flutter/material.dart';
import 'package:mobile_appiontment/components/gender_comp.dart';
import 'package:mobile_appiontment/models/user_register.dart';
import 'package:mobile_appiontment/pages/test_page.dart';
import 'package:mobile_appiontment/services/auth/auth_service.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../components/blob_animation.dart';
import '../components/fade_animation.dart';
import '../components/main_button.dart';
import '../components/main_input.dart';
import '../models/loggedIn_user_data.dart';
import '../utils/theme.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  CustomAnimationControl control = CustomAnimationControl.stop;
  bool nextPage = false;
  //sign up
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final AuthService authService = AuthService();
  final userRole = RolesName(roleName: "User", userDesc: "Normal User");
  //final TextEditingController _genderController = TextEditingController();
  String _genderController = "";
  // UserLoggedIn userRealData = UserLoggedIn();
  String token = '';
  void mapUserLoggedInData() async {
    await authService.getUserDataFromToken();
    var utoken =
        await authService.getUserRealData().then((value) => value.token!);
    if (utoken == null || utoken.isEmpty) {
      setState(() {
        token = "";
      });
    } else {
      setState(() {
        token = utoken;
      });
    }
  }

  final TextEditingController _phoneNumberController = TextEditingController();
  //final TextEditingController _fullNameController = TextEditingController();
  // final TextEditingController _fullNameController = TextEditingController();
  // final TextEditingController _fullNameController = TextEditingController();
  final List<RolesName> roles = [];
  void signUpUser() {
    authService.signUpUser(
      context: context,
      userName: _userNameController.text,
      email: _emailController.text,
      password: _passwordContoller.text,
      fullName: _fullNameController.text,
      gender: _genderController,
      phoneNumber: _phoneNumberController.text,
      rolesNames: roles,
    );
  }

  void selectGender(String gender) {
    setState(() {
      _genderController = gender;
    });
  }

  String? validateUserName(String? val) {
    //<-- add String? as a return type
    if (val!.isEmpty) {
      return "اسم المستخدم مطلوب";
    }
    return null;
  }

  String? validateFullName(String? val) {
    //<-- add String? as a return type
    if (val!.isEmpty) {
      return "الاسم الكامل مطلوب";
    }
    return null;
  }

  String? validateEmail(String? val) {
    //<-- add String? as a return type
    if (val!.isEmpty) {
      return "الايميل مطلوب";
    }
    return null;
  }

  String? validatePhoneNumber(String? val) {
    //<-- add String? as a return type
    if (val!.isEmpty) {
      return "رقم الهاتف مطلوب";
    }
    return null;
  }

  String? validatePassword(String? val) {
    //<-- add String? as a return type
    if (val!.isEmpty) {
      return "الرمز السري مطلوب";
    }
    return null;
  }

  String? validateGender(String? val) {
    //<-- add String? as a return type
    if (val!.isEmpty) {
      return "يرجى اختيار الجنس";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    token = "";
    Future.delayed(const Duration(microseconds: 50));
    mapUserLoggedInData();
    Future.delayed(const Duration(microseconds: 50));
    debugPrint("Token Check => $token");
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        control = CustomAnimationControl.play;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return token.isEmpty
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
                    child_: Form(
                      key: _signUpFormKey,
                      child: Align(
                        alignment: Alignment.center,
                        child: ListView(children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 70, left: 50, right: 50),
                            child: Text(
                              "تسجيل جديد",
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
                              controller: _fullNameController,
                              validator: validateFullName,
                              hintText: " اسم المستخدم الكامل",
                              icon: const Icon(
                                Icons.person_pin_rounded,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 34, left: 50, right: 50),
                            child: MainInput(
                              hintText: "اسم المستخدم ",
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
                              hintText: "رقم الهاتف",
                              controller: _phoneNumberController,
                              validator: validatePhoneNumber,
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 34, left: 50, right: 50),
                            child: MainInput(
                              hintText: "البريد الألكتروني",
                              controller: _emailController,
                              validator: validateEmail,
                              icon: const Icon(
                                Icons.mail,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 34, left: 50, right: 50),
                              child: Center(
                                  child: Container(
                                      height: 80,
                                      child: GenderSelector(
                                          onSonChanged: (String gender) =>
                                              selectGender(gender))))),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 34, left: 50, right: 50),
                            child: MainInput(
                              obscureText: true,
                              autocorrect: false,
                              enableSuggestions: false,
                              hintText: "كلمة المرور",
                              controller: _passwordContoller,
                              validator: validatePassword,
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
                              //  bottom: 30,
                            ),
                            child: MainButton(
                                text: "تسجيل",
                                onPressed: () {
                                  debugPrint("clicked");
                                  debugPrint(
                                      "${_signUpFormKey.currentState!.validate()}");
                                  debugPrint(_genderController);
                                  if (_genderController.isEmpty ||
                                      _genderController == null) {
                                    showTopSnackBar(
                                      context,
                                      const CustomSnackBar.error(
                                        message: "يرجى اختيار الجنس",
                                      ),
                                    );
                                  }
                                  if (_signUpFormKey.currentState!.validate()) {
                                    setState(() {
                                      roles.add(userRole);
                                    });
                                    debugPrint(roles[0].roleName);
                                    debugPrint(_signUpFormKey.currentState!
                                        .validate()
                                        .toString());

                                    signUpUser();
                                  }

                                  //  setState(() {});
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 50,
                              right: 50,
                              bottom: 30,
                              top: 30,
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("لديك حساب سابق? ",
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
                                              child: const LoginPage()));
                                    },
                                    child: Text("تسجيل الدخول",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ThemeApp().colors[0])),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  )
                                ]),
                          )
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
                                    size: const Size(
                                        double.infinity, double.infinity),
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
                                    size: const Size(
                                        double.infinity, double.infinity),
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
