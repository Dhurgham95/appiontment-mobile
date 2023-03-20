import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_appiontment/constants/utlis.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnakeBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnakeBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnakeBar(context, jsonDecode(response.body)['error']);
  }
}
