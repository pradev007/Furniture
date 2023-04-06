import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var isAddedToCart = false.obs;

  void addToCart() {
    // Logic to add product to cart goes here
    // For this example, we'll just set isAddedToCart to true
    isAddedToCart.value = true;
  }
}
