// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../../models/user.dart';

// class AuthService {
//   void signUpUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//     required String ,
//   }) async {
//     try {
//       User user = User(
//         id: 0,
//         name: name,
//         email: email,
//         password: password,
//         address: '',
//         type: '',
//         token: '',
//       );

//     } catch (e) {
//      // ShowSnakeBar(context, e.toString());
//     }
//   }
// }
import 'dart:convert';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mobile_appiontment/models/logged_in_user.dart';
import 'package:mobile_appiontment/models/user_register.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_appiontment/pages/login_page.dart';
import 'package:mobile_appiontment/pages/splash_screen.dart';
import 'package:mobile_appiontment/pages/test_page.dart';
// import 'package:mobile_appiontment/providers/logged_in_user_provider.dart';
// import 'package:mobile_appiontment/providers/user_main_data_provider.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../constants/error_handling.dart';
import '../../constants/global_variables.dart';
// import '../../constants/utlis.dart';
import '../../models/loggedIn_user_data.dart';
import '../../models/user_main_data.dart';

class AuthService {
  void showBarCustomMsg(BuildContext context, String msg) {
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        backgroundColor: const Color(0xffE3E7F1),
        message: msg,
        textStyle: const TextStyle(color: Colors.black),
      ),
    );
  }

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String fullName,
    required String userName,
    required String phoneNumber,
    required String gender,
    required List<RolesName> rolesNames,
  }) async {
    try {
      UserRegister user = UserRegister(
        //id: -10,
        // id: ,
        fullName: fullName,
        email: email,
        password: password,
        gender: gender,
        phoneNumber: phoneNumber,
        userName: userName,
        rolesNames: rolesNames,
      );
      // debugPrint(user.fullName.toString());
      // debugPrint(user.userName.toString());
      // debugPrint(user.email.toString());
      // debugPrint(user.password.toString());
      // debugPrint(user.gender.toString());
      // debugPrint(jsonEncode(user));
      // user.toJson().forEach((key, value) {
      //   debugPrint("$key => $value");
      // });
      // debugPrint(user.rolesNames[0].roleName.toString());
      http.Response res = await http.post(Uri.parse('$uri/register'),
          body: jsonEncode(user),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      //print(res.statusCode);
      httpErrorHandle(
        context: context,
        response: res,
        onSuccess: () {
          //   debugPrint(res.body);
          showBarCustomMsg(context, "تم انشاء مستخدم جديد بنجاح");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
          // showSnakeBar(
          //   context,
          //   'Account created! Login with the same credentials!',
          // );
        },
      );
    } catch (e) {
      showBarCustomMsg(context, e.toString());
      //showSnakeBar(context, e.toString());
    }
  }

  Future<void> logIn(context, String name, String password) async {
    final response = await http.post(Uri.parse('$uri/login'),
        body: jsonEncode({'userName': name, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if (response.body.isNotEmpty) {
      var loginResponse = json.decode(response.body);

      final loginResult = LoggedInUserResponse.fromJson(loginResponse);
      if (loginResult.isLoginSucceed!) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // Map<String, dynamic> resmap = json.decode(response.body);
        // String errorMes = resmap["errorMessage"];
        // int userId = resmap["userId"];
        // bool isSuccess = resmap["isLoginSucceed"];
        // String tknn = resmap["token"];
        //Provider.of<UserProvider>(context, listen: false).user = loginResult;
        await prefs.setString('x-auth-token', loginResult.token!);
        var testtoken = prefs.getString('x-auth-token');
        //debugPrint(testtoken);
        if (testtoken == testtoken) {
          debugPrint('token valid store');
        }
        await prefs.setInt('userid', loginResult.userId!);
        showBarCustomMsg(context, "تم تسجيل الدخول بنجاح");
        debugPrint("valuess");
        debugPrint(prefs.getString('x-auth-token'));
        debugPrint(prefs.getInt('userid').toString());
        // debugPrint(
        //     Provider.of<UserProvider>(context, listen: false).user.token);
        //    return loginResult;
      }
      // var loginResponse = json.decode(response.body);

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      showBarCustomMsg(context, "خطا في تسجيل الدخول");
      //  return null;
      //throw Exception('Failed to load album');
    }
  }

  Future<UserLoggedIn> getUserRealData() async {
    final UserLoggedIn user = UserLoggedIn();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user.token = prefs.getString('x-auth-token')!;
    user.id = prefs.getInt('userid') == null ? 0 : prefs.getInt('userid');
    user.userName =
        prefs.getString('username') == null ? "" : prefs.getString('username');
    user.roles = prefs.getStringList('roles') == null
        ? []
        : prefs.getStringList('roles');

    return user;
    //  user.phoneNumber =  prefs.setStringList('roles', List<String>.empty());
  }

  void logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('x-auth-token', '');
    await prefs.setInt('userid', 0);
    await prefs.setString('username', '');
    await prefs.setStringList('roles', List<String>.empty());
  }

  void logoutRoute(BuildContext context) {
    // Navigator.pushAndRemoveUntil(context, '/splash', (Route<dynamic> route) => false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const SplashPage(),
      ),
      (route) => false,
    );
  }

  void loginRoute(BuildContext context) {
    // Navigator.pushAndRemoveUntil(context, '/splash', (Route<dynamic> route) => false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => TestPage(),
      ),
      (route) => false,
    );
  }

  Future<void> getUserDataFromToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> roles = [];
    var token = prefs.getString('x-auth-token');
    if (token == null || token.isEmpty) {
      prefs.setString('x-auth-token', '');
    } else {
      http.Response response = await http.post(
        Uri.parse('$uri/validatetoken'),
        headers: {
          // 'Accept': 'application/json',
          //'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({'tokenString': token}),
      );

      var getUserDataresponse = json.decode(response.body);
      final getUserDataResult = UserMainData.fromJson(getUserDataresponse);
      if (getUserDataResult.id != 0) {
        await prefs.setString('username', getUserDataResult.userName!);
        for (int i = 0; i < getUserDataResult.jwtRoles!.length; i++) {
          roles.add(getUserDataResult.jwtRoles![i].roleName!);
        }
        await prefs.setStringList('roles', roles);
        var roless = prefs.getStringList('roles');
        var uname = prefs.getString('username');

        //await prefs.setStringList('roles', getUserDataResult.jwtRoles.toList().)

        // Provider.of<UserMainDataProvider>(context)
        //     .setUserMainData(getUserDataResult);
        debugPrint("getDataAuth");
        debugPrint(uname);
        for (int i = 0; i < roless!.length; i++) {
          debugPrint(roles[i]);
        }
      }
      // debugPrint(
      //     "providerdata => ${Provider.of<UserMainDataProvider>(context, listen: false).getUserMainDat().userName}");
    }
  }

  // get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/validatetoken'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //  'x-auth-token': token!
        },
        body: jsonEncode({'tokenString': token}),
      );

      //  var response = json.decode(tokenRes.body);
      // debugPrint(tokenRes.body);
    } catch (e) {
      // ShowSnakeBar(context, e.toString());
    }
  }
}
