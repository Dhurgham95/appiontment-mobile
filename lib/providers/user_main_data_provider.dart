import 'package:flutter/material.dart';

import '../models/user_main_data.dart';

class UserMainDataProvider extends ChangeNotifier {
  UserMainData _userMain = UserMainData(
    id: 0,
    userName: '',
    phoneNumber: '',
    jwtRoles: <JwtRoles>[],
  );

  UserMainData getUserMainDat() {
    return _userMain;
  }

  void setUserMainData(UserMainData usr) async {
    _userMain = usr;
    await Future.delayed(const Duration(milliseconds: 1));
    notifyListeners();
  }
  // UserMainData get user => _userMain;

  // set user(UserMainData value) {
  //   _userMain = value;

  //   notifyListeners();
  // }

  // void setUser(String user) {
  //   _userMain = UserMainData.fromJson(jsonDecode(user));
  //   notifyListeners();
  // }
}
