import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/model/register_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../login/views/login_view.dart';
import '../../utils/helpers.dart';

class SignupController extends GetxController {
  TextEditingController userAddressTextEditingController = TextEditingController();
  TextEditingController contactTextEditingController = TextEditingController();
  TextEditingController userEmailTextEditingController = TextEditingController();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  // handleRegisterUser(GlobalKey<FormState> formKey) async {
  //   if (formKey.currentState!.validate()) {
  //     await register();
  //   }
  // }

  register() async {
    try {
      RegisterModel registerModel = RegisterModel(
      userAddress: userAddressTextEditingController.text,
      userContact: contactTextEditingController.text,
      userEmail: userEmailTextEditingController.text,
      userName: userNameTextEditingController.text,
      password: passwordTextEditingController.text,
      );

      http.Response response =
          await AuthApiServices().registerUser(registerModel);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Get.to(() => LoginView());
        // Get.to(() => LoginPage());
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        // ignore: unused_local_variable
        var responseBody = jsonDecode(response.body);
        Helpers.showMessage(
            message: "Invalid data in the field", isError: true);
      } else {
        throw Exception();
      }
    } catch (e) {
      e.printError();
      Helpers.showMessage(message: "Something went wrong ", isError: true);
    }
  }
}
