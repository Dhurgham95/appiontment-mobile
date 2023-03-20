import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_appiontment/models/edit_appiontment_res.dart';

import '../../constants/global_variables.dart';

Future<EditAppiontmentResponseModel> editAppiontemnt(
    String apptTime, String apptDate, int appId) async {
  const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QiLCJpZCI6IjUiLCJwaG9uZW51bWJlciI6IjY2NjY2IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIlVzZXIiLCJBZG1pbiIsIkVtcGxveWVlIl0sImV4cCI6MTY2MDM4OTk3MSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzA4OC8iLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo3MDg4LyJ9.5rCE1rA7shZ5OdcoxY7qoK0MEKCixpx0o3SL9jGKWp0';
  http.Response response = await http.post(
    Uri.parse('$uri/editappiontment'),
    headers: {
      // 'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode({
      'appId': appId,
      'appiontmentDate': apptDate,
      'appiontmentTime': apptTime
    }),
  );

  var editresponse = json.decode(response.body);
  final addingResult = EditAppiontmentResponseModel.fromJson(editresponse);
  return addingResult;
}
