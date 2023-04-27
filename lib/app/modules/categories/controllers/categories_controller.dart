import 'dart:convert';
import 'dart:developer';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/model/category_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/helpers.dart';
import '../../utils/user_service.dart';

class CategoriesController extends GetxController {
  var isAddedToCart = false.obs;
  UserService user = Get.find();

  void addToCart() {
    // Logic to add product to cart goes here
    // For this example, we'll just set isAddedToCart to true
    isAddedToCart.value = true;
  }

  var categoryById = <CategoryByIdModel>[];
  late int categoryId;

  fetchCategoryDetails() async {
    try {
      http.Response response = await AuthApiServices().categoryById(categoryId);
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

  addCarts(int productID) async {
    log("Hello world");
    try {
      http.Response response =
          await AuthApiServices().addToCart(productID, user.userToken);
      var body = response.body;
      var responseBody = jsonDecode(body);
      if (response.statusCode == 200 && response.statusCode <= 300) {
        print(responseBody);
        // isFavorite(true);
        Helpers.showToastMessage(message: responseBody["message"]);
        update();
      } else if (response.statusCode == 400 && response.statusCode < 500) {
        Helpers.showToastMessage(message: responseBody['message']);
      } else {
        throw Exception();
      }
    } catch (e) {
      // log(e.toString());
      Future.error(e.toString());
    }
  }
}
