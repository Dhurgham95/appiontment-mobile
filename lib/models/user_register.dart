// To parse this JSON data, do
//
//     final userRegister = userRegisterFromJson(jsonString);

import 'dart:convert';

UserRegister userRegisterFromJson(String str) =>
    UserRegister.fromJson(json.decode(str));

String userRegisterToJson(UserRegister data) => json.encode(data.toJson());

class UserRegister {
  UserRegister({
    required this.userName,
    required this.fullName,
    required this.phoneNumber,
    required this.gender,
    required this.email,
    required this.password,
    required this.rolesNames,
  });

  String userName;
  String fullName;
  String phoneNumber;
  String gender;
  String email;
  String password;
  List<RolesName> rolesNames;

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
        userName: json["userName"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        email: json["email"],
        password: json["password"],
        rolesNames: List<RolesName>.from(
            json["rolesNames"].map((x) => RolesName.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "email": email,
        "password": password,
        "rolesNames": List<dynamic>.from(rolesNames.map((x) => x.toJson())),
      };
}

class RolesName {
  RolesName({
    required this.roleName,
    required this.userDesc,
  });

  String roleName;
  String userDesc;

  factory RolesName.fromJson(Map<String, dynamic> json) => RolesName(
        roleName: json["RoleName"],
        userDesc: json["UserDesc"] == null ? null : json["UserDesc"],
      );

  Map<String, dynamic> toJson() => {
        "RoleName": roleName,
        "UserDesc": userDesc == null ? null : userDesc,
      };
}
