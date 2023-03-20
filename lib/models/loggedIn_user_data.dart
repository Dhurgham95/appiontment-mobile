import 'dart:convert';

class UserLoggedIn {
  String? userName;
  int? id;
  String? phoneNumber;
  List<String>? roles;
  String? token;
  UserLoggedIn({
    this.userName,
    this.id,
    this.phoneNumber,
    this.roles,
    this.token,
  });

  // UserLoggedIn(
  //     {this.userName, this.id, this.phoneNumber, this.token, this.roles});

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'id': id,
      'phoneNumber': phoneNumber,
      'roles': roles,
      'token': token,
    };
  }

  factory UserLoggedIn.fromMap(Map<String, dynamic> map) {
    return UserLoggedIn(
      userName: map['userName'],
      id: map['id']?.toInt(),
      phoneNumber: map['phoneNumber'],
      roles: List<String>.from(map['roles']),
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoggedIn.fromJson(String source) =>
      UserLoggedIn.fromMap(json.decode(source));
}
