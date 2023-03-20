// To parse this JSON data, do
//
//     final LoggedInUserResponse = LoggedInUserResponseFromJson(jsonString);

// To parse this JSON data, do
//
//     final LoggedInUserResponse = LoggedInUserResponseFromJson(jsonString);

// To parse this JSON data, do
//
//     final LoggedInUserResponse = LoggedInUserResponseFromJson(jsonString);

class LoggedInUserResponse {
  int? userId;
  String? token;
  String? errorMessage;
  bool? isLoginSucceed;

  LoggedInUserResponse({
    this.userId,
    this.token,
    this.errorMessage,
    this.isLoginSucceed,
  });

  LoggedInUserResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    isLoginSucceed = json['isLoginSucceed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['token'] = token;
    data['errorMessage'] = errorMessage;
    data['isLoginSucceed'] = isLoginSucceed;

    return data;
  }
}
