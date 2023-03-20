class EditAppiontmentRequest {
  int? appId;
  String? appiontmentDate;
  String? appiontmentTime;

  EditAppiontmentRequest(
      {this.appId, this.appiontmentDate, this.appiontmentTime});

  EditAppiontmentRequest.fromJson(Map<String, dynamic> json) {
    appId = json['appId'];
    appiontmentDate = json['appiontmentDate'];
    appiontmentTime = json['appiontmentTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appId'] = appId;
    data['appiontmentDate'] = appiontmentDate;
    data['appiontmentTime'] = appiontmentTime;
    return data;
  }
}
