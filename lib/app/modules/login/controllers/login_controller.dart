import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/navigation/bindings/navigation_binding.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/login_model.dart';
import '../../navigation/views/navigation_view.dart';
import '../../utils/helpers.dart';
import 'package:http/http.dart' as http;
import '../../utils/secure_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  Map<String, dynamic> users = {};

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
        users = responseBody['data'];
        String jsonValue = json.encode(users);
        storeLoginInfo(
          responseBody['token'],
          jsonValue,
        );
        Get.to(() => NavigationView(), binding: NavigationBinding());
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

  void storeLoginInfo(String token, String users) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
    pref.setString('user', users);
    update();
  }
}
