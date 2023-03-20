class AppiontmentListModel {
  int? userId;
  int? appiontmentId;
  String? timeOfAppiontment;
  String? dateOfAppiontment;
  String? status;

  AppiontmentListModel(
      {this.userId,
      this.appiontmentId,
      this.timeOfAppiontment,
      this.dateOfAppiontment,
      this.status});

  AppiontmentListModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    appiontmentId = json['appiontmentId'];
    timeOfAppiontment = json['timeOfAppiontment'];
    dateOfAppiontment = json['dateOfAppiontment'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['appiontmentId'] = this.appiontmentId;
    data['timeOfAppiontment'] = this.timeOfAppiontment;
    data['dateOfAppiontment'] = this.dateOfAppiontment;
    data['status'] = this.status;
    return data;
  }
}
