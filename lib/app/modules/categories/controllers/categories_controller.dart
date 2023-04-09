import 'dart:convert';

import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/model/category_details.dart';
import 'package:get/get.dart';

import '../../model/category.dart';
import 'package:http/http.dart' as http;

import '../../utils/helpers.dart';

class CategoriesController extends GetxController {
  var isAddedToCart = false.obs;

  void addToCart() {
    // Logic to add product to cart goes here
    // For this example, we'll just set isAddedToCart to true
    isAddedToCart.value = true;
  }

  var categoryById = <CategoryByIdModel>[];
  int? categoryId;

  fetchCategoryDetails() async {
    try {
      http.Response response =
          await AuthApiServices().categoryById(categoryId!);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        categoryById = CategoryByIdModel.categoryByIdModelFromJson(
            jsonEncode(responseBody["data"]));
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
    return categoryById;
  }
}
