class AddAppiontmentResponseModel {
  bool? isSucceed;
  String? errorMessage;

  AddAppiontmentResponseModel({this.isSucceed, this.errorMessage});

  AddAppiontmentResponseModel.fromJson(Map<String, dynamic> json) {
    isSucceed = json['isSucceed'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSucceed'] = isSucceed;
    data['errorMessage'] = errorMessage;
    return data;
  }
}
