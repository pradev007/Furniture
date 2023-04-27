import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/model/payment_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/address_details.dart';
import '../../model/cart_details.dart';
import '../../model/total_cart.dart';
import '../../utils/helpers.dart';
import '../../utils/user_service.dart';

class CartController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  var cart = <CartDetailsModel>[];
  UserService user = Get.find();

  fetchCart() async {
    try {
      http.Response response =
          await AuthApiServices().cartDetail(user.userToken);
      // log(response.body);
      var body = response.body;
      var responseBody = jsonDecode(body);
      if (response.statusCode == 200 && response.statusCode <= 300) {
        cart = CartDetailsModel.cartDetailsModelFromJson(
            jsonEncode(responseBody["data"]));
        update();
      } else if (response.statusCode == 400 && response.statusCode < 500) {
        Helpers.showToastMessage(message: responseBody['message']);
      } else {
        throw Exception();
      }
    } catch (e) {
      // log(e.toString());
      print("Line number 35: ${e.toString()}");
    }
    return cart;
  }

  late CartNumberModel cartNumberModel;

  fetchTotalCart() async {
    try {
      http.Response response =
          await AuthApiServices().totalCarts(user.userToken);
      // var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        cartNumberModel =
            CartNumberModel.cartNumberModelFromJson(response.body);
        update();
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        var responseBody = jsonDecode(response.body);
        Helpers.showToastMessage(message: responseBody["message"]);
      } else {
        throw Exception();
      }
    } catch (e) {
      e.printError();
      Helpers.showToastMessage(message: "Something went wrong");
    }
    return cartNumberModel;
  }

  fetchIncreaseQuantity(int increaseId) async {
    try {
      http.Response response = await AuthApiServices()
          .increaseCartQuantity(user.userToken, increaseId);
      // log(response.body);
      var body = response.body;
      var responseBody = jsonDecode(body);
      if (response.statusCode == 200 && response.statusCode <= 300) {
        update();
      } else if (response.statusCode == 400 && response.statusCode < 500) {
        Helpers.showToastMessage(message: responseBody['message']);
      } else {
        throw Exception();
      }
    } catch (e) {
      // log(e.toString());
      print("Line number 35: ${e.toString()}");
    }
  }

  fetchDecreaseQuantity(decreaseId) async {
    log('line 102');
    try {
      http.Response response = await AuthApiServices()
          .decreaseCartQuantity(user.userToken, decreaseId);
      // log(response.body);
      var body = response.body;
      var responseBody = jsonDecode(body);
      if (response.statusCode == 200 && response.statusCode <= 300) {
        log(response.statusCode.toString());
        update();
      } else if (response.statusCode == 400 && response.statusCode < 500) {
        Helpers.showToastMessage(message: responseBody['message']);
      } else {
        throw Exception();
      }
    } catch (e) {
      // log(e.toString());
      print("Line number 35: ${e.toString()}");
    }
  }

  var address = <AddressDetailsModel>[];

  fetchAddress() async {
    try {
      http.Response response =
          await AuthApiServices().getAddressess(user.userToken);
      // log(response.body);
      var body = response.body;
      var responseBody = jsonDecode(body);
      if (response.statusCode == 200 && response.statusCode <= 300) {
        address = AddressDetailsModel.addressDetailsModelFromJson(
            jsonEncode(responseBody));
        update();
      } else if (response.statusCode == 400 && response.statusCode < 500) {
        Helpers.showToastMessage(message: responseBody['message']);
      } else {
        throw Exception();
      }
    } catch (e) {
      // log(e.toString());
      print("Line number 35: ${e.toString()}");
    }
    return address;
  }

  makeOrder(int amount) async {
    try {
      PaymentModel paymentModel = PaymentModel(
        amount: amount,
        userAddress: addressController.text,
        city: cityController.text,
        mobile: phoneController.text
      );

      http.Response response =
          await AuthApiServices().addOrder(paymentModel, user.userToken);
      log(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Get.to(() => LoginView());
        Helpers.showToastMessage(
            message: "Order has been added successfully");
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
}
