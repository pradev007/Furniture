import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:get/get.dart';
import '../../model/login_model.dart';
import '../../navigation/views/navigation_view.dart';
import '../../utils/helpers.dart';
import 'package:http/http.dart' as http;
import '../../utils/secure_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  handleUserLogin(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      await login();
    }
  }

  login() async {
    try {
      Login loginModel = Login(
        userEmail: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );

      http.Response response = await AuthApiServices().loginUser(loginModel);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseBody = jsonDecode(response.body);
        //await storeLoginInfo(responseBody["data"]);
        Get.to(() => NavigationView());
        Helpers.showMessage(
            message: "User Logged in SucessFully", isError: false);
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        // ignore: unused_local_variable
        var responseBody = jsonDecode(response.body);
        Helpers.showMessage(
            message: "Invalid Username or Password", isError: true);
      } else {
        throw Exception();
      }
    } catch (e) {
      e.printError();
      Helpers.showMessage(message: "Something went wrong ", isError: true);
    }
  }

  storeLoginInfo(Map<String, dynamic> response) async {
    SecureStorageService secureStorageService = SecureStorageService();
    String accessToken = response["token"];

    await secureStorageService.setValue(
      key: "token",
      value: accessToken,
    );
  }

  getLoginInfo() async {
    SecureStorageService secureStorageService = SecureStorageService();
    // ignore: unused_local_variable
    String? token = await secureStorageService.getValue(key: 'token');
  }
}
