class EditAppiontmentResponseModel {
  bool? isSucceed;
  String? errorMessage;

  EditAppiontmentResponseModel({this.isSucceed, this.errorMessage});

  EditAppiontmentResponseModel.fromJson(Map<String, dynamic> json) {
    isSucceed = json['isSucceed'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSucceed'] = isSucceed;
    data['errorMessage'] = errorMessage;
    return data;
  }
}
