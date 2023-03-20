class UserMainData {
  String? userName;
  int? id;
  String? phoneNumber;
  List<JwtRoles>? jwtRoles;

  UserMainData({this.userName, this.id, this.phoneNumber, this.jwtRoles});

  UserMainData.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    if (json['jwtRoles'] != null) {
      jwtRoles = <JwtRoles>[];
      json['jwtRoles'].forEach((v) {
        jwtRoles!.add(JwtRoles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = userName;
    data['id'] = id;
    data['phoneNumber'] = phoneNumber;
    if (this.jwtRoles != null) {
      data['jwtRoles'] = jwtRoles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JwtRoles {
  String? roleName;

  JwtRoles({this.roleName});

  JwtRoles.fromJson(Map<String, dynamic> json) {
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleName'] = roleName;
    return data;
  }
}
