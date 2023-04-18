import 'dart:convert';

import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/model/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/helpers.dart';

class ProductsController extends GetxController {
  late ProductDetails productDetails;
  late int productDetailId;

  fetchProductDetails() async {
    try {
      http.Response response =
          await AuthApiServices().productDetail(productDetailId);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        productDetails = ProductDetails.productDetailsFromJson(
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
    return productDetails;
  }
}
