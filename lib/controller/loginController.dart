import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:truck_delivery_customer/screen/dashboard_screen.dart';

import '../utils/api_end_points.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'userPhone': emailController.text.trim(),
        'userPassword': passwordController.text
      };

      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status']) {
          emailController.clear();
          passwordController.clear();

          Get.off(DashboardScreen());
        } else {
          throw jsonDecode(response.body)['Message'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
