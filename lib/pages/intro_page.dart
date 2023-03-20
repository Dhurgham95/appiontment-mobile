import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_appiontment/pages/test_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:simple_animations/simple_animations.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../components/blob_animation.dart';
import '../components/fade_animation.dart';
import '../components/main_button.dart';
import '../components/shape_transition.dart';

import '../models/loggedIn_user_data.dart';
import '../providers/logged_in_user_provider.dart';
import '../services/auth/auth_service.dart';
import '../utils/shape_transition_controller.dart';
import '../utils/theme.dart';
import 'login_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  CustomAnimationControl control = CustomAnimationControl.play;
  // UserLoggedIn userRealData = UserLoggedIn();
  final AuthService authService = AuthService();
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

  // UserMainData usr = UserMainData();
  ShapeTransitionController controller = new ShapeTransitionController();
  @override
  void initState() {
    token = "";
    Future.delayed(const Duration(microseconds: 50));
    super.initState();
    Future.delayed(const Duration(microseconds: 50));
    mapUserLoggedInData();
    debugPrint("Token Check => $token");
    // Provider.of<TestProvider>(context, listen: false).setModelTest(tt);
    // testtt = Provider.of<TestProvider>(context, listen: false)
    //     .getModelTest()
    //     .userId!;
    // getTokenn();
  }

  bool nextPage = false;

  // final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//  String tokenn = '';

  // void getTokenn() async {
  //  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //   //  tokenn = (prefs.getString('x-auth-token') ?? '');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final userProvider =
    //     Provider.of<UserProvider>(context, listen: false).user.userId;
    // final mainProvider =
    //     Provider.of<UserMainDataProvider>(context, listen: false).user.id;
    // setState(() {
    //   //   usr.id = Provider.of<UserMainDataProvider>(context).user.id;
    //   //uid = usr.id!;
    // });

    // final UserMainData userData =
    //     Provider.of<UserMainDataProvider>(context, listen: false).user;
    return token.isEmpty
        ? Scaffold(
            body: ShapeTransition(
              color: ThemeApp().colors[0],
              controller: controller,
              onFinish: () {
                setState(() {
                  nextPage = true;
                  control = CustomAnimationControl.playReverse;
                });
              },
              child: Stack(
                children: [
                  CustomAnimation<double?>(
                      control: control,
                      tween: Tween(begin: -400, end: -200), // define tween
                      duration: const Duration(seconds: 1), // define duration
                      curve: Curves.easeInOutCubic,
                      onComplete: () {
                        if (nextPage) {
                          Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(seconds: 1),
                                      child: LoginPage()))
                              .then((value) {
                            setState(() {
                              nextPage = false;
                              controller.control =
                                  CustomAnimationControl.playReverse;
                              control = CustomAnimationControl.play;
                            });
                          });
                        }
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
                      delay_: const Duration(milliseconds: 1500),
                      child_: Align(
                        alignment: Alignment.center,
                        child: ListView(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 150),
                            child: SvgPicture.asset("assets/svg/doc_logo.svg",
                                height: 150,
                                width: 150,
                                semanticsLabel: 'Blob 2'),
                          ),
                          const Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: 70, left: 50, right: 50),
                              child: Text(
                                "تطبيق حجز مواعيد",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 15, left: 50, right: 50),
                            child: Text(
                              "يوفر هذا التطبيق خدمة حجز المواقع الكترونيا لتسهيل الحجر للعيادة الليزرية",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                                left: 50,
                                right: 50,
                              ),
                              child: Column(
                                children: [
                                  MainButton(
                                      text: "متابعة",
                                      onPressed: () {
                                        //   debugPrint("aaaa");
                                        // debugPrint(Provider.of<UserProvider>(context,
                                        //         listen: false)
                                        //     .user
                                        //     .token);

                                        // debugPrint("user Provider => $uid");
                                        // debugPrint("main Provider => $mainProvider");
                                        //  debugPrint(aa.user.userId.toString());
                                        //  debugPrint(bb.user.userName)
                                        setState(() {
                                          controller.playAnimation();
                                          // control = CustomAnimationControl.playReverse;
                                        });

                                        //  debugPrint("userId ==> $testtt");
                                      }),
                                  // Provider.of<UserProvider>(context)
                                  //         .user
                                  //         .userId!
                                  //         .toString()
                                  //         .isEmpty
                                  //     ? Text("aa")
                                  //     : Text("bb")
                                ],
                              ))
                        ]),
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
                            child: SizedBox(
                              height: 80,
                              child: WaveWidget(
                                config: CustomConfig(
                                  colors: ThemeApp().colors,
                                  durations: ThemeApp().durations,
                                  heightPercentages:
                                      ThemeApp().heightPercentages,
                                ),
                                size: Size(double.infinity, double.infinity),
                                waveAmplitude: 0,
                              ),
                            ));
                      })
                ],
              ),
            ),
          )
        : TestPage();
  }
}
