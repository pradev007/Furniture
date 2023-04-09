import 'dart:convert';

import 'package:fyp/app/const/app_api.dart';
import 'package:get/get.dart';

import '../../model/category.dart';
import 'package:http/http.dart' as http;

import '../../model/latest_product.dart';
import '../../utils/helpers.dart';

class HomeController extends GetxController {
var category = <CategoryModel>[];

  fetchCategory() async {
    try {
      http.Response response = await AuthApiServices().categories();
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        category = CategoryModel.categoryModelFromJson(jsonEncode(responseBody["data"]));
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
    return category;
  }

    var latestProduct = <LatestArrivalModel>[];

  fetchLatestProduct() async {
    try {
      http.Response response = await AuthApiServices().latestProduct();
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        latestProduct = LatestArrivalModel.latestArrivalModelFromJson(jsonEncode(responseBody["data"]));
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
    return latestProduct;
  }
}
