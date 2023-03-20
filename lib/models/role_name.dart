class RoleName {
  RoleName({
    required this.roleName,
    required this.roleDesc,
  });
  late final String roleName;
  late final String roleDesc;

  RoleName.fromJson(Map<String, dynamic> json) {
    roleName = json['roleName'];
    roleDesc = json['roleDesc'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['roleName'] = roleName;
    _data['roleDesc'] = roleDesc;
    return _data;
  }
}
