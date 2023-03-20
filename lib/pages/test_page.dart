import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:mobile_appiontment/pages/main_page.dart';
import 'package:mobile_appiontment/pages/splash_screen.dart';
import 'package:mobile_appiontment/services/auth/auth_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../components/lazor_body.dart';
import '../components/list_viewtest.dart';

class TestPage extends StatefulWidget {
  static const String routeName = '/test';
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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

  List<Widget> pages = [
    const LstView(),
    const MainPage(),
    //  const LazorBody(),
    // TestListViewBuilder(),
    // const Center(
    //   child: Text("4 Page"),
    // ),
    // Center(
    //   child: Text("ggg"),
    // ),
  ];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  // void logout(BuildContext context) async {
  //   authService.logoutUser(context);
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const SplashPage()),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    token = "";
    Future.delayed(const Duration(microseconds: 50));
    mapUserLoggedInData();
    Future.delayed(const Duration(microseconds: 50));
    debugPrint("Token Check => $token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("نظام الحجز"),
              IconButton(
                splashRadius: 12,
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 200,
                      // decoration: const BoxDecoration(
                      //     color: Color(0xffBDC6D9),
                      //     borderRadius:
                      //         BorderRadius.all(Radius.circular(60.0))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                authService.logoutUser();
                                authService.logoutRoute(context);
                              },
                              icon:
                                  const Icon(Icons.power_settings_new_rounded),
                              color: Colors.redAccent,
                              iconSize: 40,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "تسجيل الخروج",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.settings),
                color: Colors.white,
              )
            ],
          ),
          backgroundColor: const Color(0xff52688F),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.list, size: 30),
            Icon(Icons.add, size: 30),
            // Icon(Icons.female_rounded, size: 30),
            // Icon(Icons.call_split, size: 30),
            // Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: const Color(0xff52688F),
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: pages[_page]);
  }
}
