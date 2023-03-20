import 'package:flutter/material.dart';
import 'package:mobile_appiontment/components/lazor_body.dart';
import 'package:mobile_appiontment/models/loggedIn_user_data.dart';
import 'package:mobile_appiontment/models/user_main_data.dart';
import 'package:mobile_appiontment/pages/lazor_page.dart';
import 'package:mobile_appiontment/pages/splash_screen.dart';
import 'package:mobile_appiontment/pages/test_page.dart';
import 'package:mobile_appiontment/providers/logged_in_user_provider.dart';
import 'package:mobile_appiontment/providers/user_main_data_provider.dart';
import 'package:mobile_appiontment/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserMainDataProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  static const String routeName = '/';
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  final JwtRoles? jwtRole = JwtRoles();
  // List<String> roles = [];
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

  @override
  void initState() {
    super.initState();
    token = "";
    Future.delayed(const Duration(microseconds: 50));
    mapUserLoggedInData();
    Future.delayed(const Duration(microseconds: 50));
    debugPrint("Token Check => $token");
    //authService.getUserData(context);
    //authService.getUserDataFromToken();

    //checkIsLogin();

    //add role to it
    //  jwtRole!.roleName = "User";
    //  printValues();
  }

  // Future<String?> getTokenn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var result = prefs.getString('x-auth-token');
  //   return result;
  // }

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

  //     //replace it with the login page
  //     // Navigator.pushReplacement(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => new LoginPage()),
  //     // );
  //   }
  // }

  void printValues() async {
    // var bb = Provider.of<UserMainDataProvider>(context, listen: false);
    // var cc = Provider.of<UserProvider>(context, listen: false);
    // debugPrint("User Name => ${bb.getUserMainDat().userName}");
    // debugPrint("token  => ${cc.user.token}");
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // debugPrint(prefs.getString("x-auth-token"));
    // debugPrint(aa.user.token);
    //debugPrint(bb.user.userName);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // const MaterialColor primaryColorShades = MaterialColor(
    //   0xFFFF6363,
    //   <int, Color>{
    //     50: Color(0xFFA4A4BF),
    //     100: Color(0xFFA4A4BF),
    //     200: Color(0xFFA4A4BF),
    //     300: Color(0xFF9191B3),
    //     400: Color(0xFF7F7FA6),
    //     500: Color(0xFFFF6363),
    //     600: Color(0xFF6D6D99),
    //     700: Color(0xFF5B5B8D),
    //     800: Color(0xFF494980),
    //     900: Color(0xFFFF6363),
    //   },
    // );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppiontmentApp',
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xffE3E7F1)),
        // ThemeData(
        //   primarySwatch: primaryColorShades,
        // ),
        home: token.isNotEmpty
            //Provider.of<UserProvider>(context).user.token!.isNotEmpty

            // ? Provider.of<UserMainDataProvider>(context)
            //         .getUserMainDat()
            //         .jwtRoles!
            //         .contains(jwtRole)
            ? TestPage()
            : const SplashPage()
        //   : TestPage()

        // Center(child: Container(height: 80, child: GenderSelector())
        // )
        );
  }
}
