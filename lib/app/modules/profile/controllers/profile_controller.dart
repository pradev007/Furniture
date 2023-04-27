import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/cart/views/order.dart';
import 'package:fyp/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/address_model.dart';
import '../../model/order_details.dart';
import '../../utils/helpers.dart';
import '../../utils/user_service.dart';

class ProfileController extends GetxController {
  UserService user = Get.find();
  TextEditingController userAddressTextEditingController =TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController numberTextEditingController =TextEditingController();
  // handleRegisterUser(GlobalKey<FormState> formKey) async {
  //   if (formKey.currentState!.validate()) {
  //     await register();
  //   }
  // }

  addAddresses() async {
    try {
      AddressModel addressModel = AddressModel(
        userAddress: userAddressTextEditingController.text,
        city: cityTextEditingController.text,
        mobile: numberTextEditingController.text
      );

      http.Response response =
          await AuthApiServices().addresses(addressModel, user.userToken);
      log(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Get.to(() => LoginView());
        Helpers.showToastMessage(
            message: "Address has been added successfully");
        // Get.to(() => LoginPage());
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        // ignore: unused_local_variable
        var responseBody = jsonDecode(response.body);
        Helpers.showMessage(message: "Empty data in the field", isError: true);
      } else {
        throw Exception();
      }
    } catch (e) {
      e.printError();
      Helpers.showMessage(message: "Something went wrong ", isError: true);
    }
  }

  var orders = <OrderDetailsModel>[];

  fetchOrders() async {
    try {
      http.Response response = await AuthApiServices().fetchOrderHistory(user.userToken);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        orders = OrderDetailsModel.orderDetailsModelFromJson(
            jsonEncode(responseBody));
        update();
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        var responseBody = jsonDecode(response.body);
        Helpers.showToastMessage(message: responseBody["message"]);
      } else {
        throw Exception();
      }
    } catch (e) {
      e.printError();
      // Helpers.showToastMessage(message: "Something went wrong");
    }
    return orders;
  }

  void logout() {
    // clear user data or any other data
    // and navigate to the login page
    // You can replace the LoginPage with your desired login page
    Get.offAll(() => LoginView());
  }
}
