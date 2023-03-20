import 'package:flutter/material.dart';

import '../models/logged_in_user.dart';

class UserProvider extends ChangeNotifier {
  LoggedInUserResponse _user = LoggedInUserResponse(
      userId: 0, errorMessage: '', token: '', isLoginSucceed: false);

  LoggedInUserResponse get user => _user;

  set user(LoggedInUserResponse value) {
    _user = value;

    //here the model value changes. you can call 'notifyListeners' to notify all the 'Consumer<UserModel>'
    notifyListeners();
  }
  // LoggedInUserResponse _user = LoggedInUserResponse(
  //     id: 0,
  //     userName: '',
  //     email: '',
  //     phoneNumber: '',
  //     gender: '',
  //     token: '',
  //     fullName: '');

  // LoggedInUserResponse get user => _user;

  // void setUser(Map<String, dynamic> user) {
  //   _user = LoggedInUserResponse.fromJson(user);
  //   notifyListeners();
  // }
}
