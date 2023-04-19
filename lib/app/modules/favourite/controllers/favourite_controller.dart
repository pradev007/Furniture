import 'package:flutter/cupertino.dart';
import 'package:fyp/app/modules/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<ProductModel> favourites = <ProductModel>[].obs;

  @override
  void onInit() {
    // Add some products to the favourites list
    favourites.addAll([
      ProductModel(
          name: 'Normal Chair', image: 'assets/images/bed.jpg', price: 9.99),
      ProductModel(
          name: 'King Size Bed', image: 'assets/images/bed.jpg', price: 14.99),
      ProductModel(
          name: 'Fancy Chair', image: 'assets/images/bed.jpg', price: 19.99),
      ProductModel(
          name: 'Wooden Chair', image: 'assets/images/bed.jpg', price: 24.99),
      ProductModel(
          name: 'Large Table', image: 'assets/images/dining.png', price: 22),
      // ProductModel(name: 'Product 6', image: 'assets/images/bed.jpg'),
      // ProductModel(name: 'Product 7', image: 'assets/images/bed.jpg'),
    ]);
    super.onInit();
  }

  void addToFavourites(ProductModel product) {
    favourites.add(product);
  }

  void removeFromFavourites(int index) {
    favourites.removeAt(index);
  }

  bool isFavourite(ProductModel product) {
    return favourites.contains(product);
  }
}

class ProductModel {
  final String name;
  final String image;
  final double price;

  ProductModel({required this.name, required this.image, required this.price});
}
