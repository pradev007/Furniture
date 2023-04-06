import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<ProductModel> favourites = <ProductModel>[].obs;

  @override
  void onInit() {
    // Add some products to the favourites list
    favourites.addAll([
      ProductModel(
          name: 'Product 1', image: 'https://picsum.photos/id/1015/200'),
      ProductModel(
          name: 'Product 2', image: 'https://picsum.photos/id/1018/200'),
      ProductModel(
          name: 'Product 3', image: 'https://picsum.photos/id/1012/200'),
      ProductModel(
          name: 'Product 4', image: 'https://picsum.photos/id/1016/200'),
      ProductModel(
          name: 'Product 5', image: 'https://picsum.photos/id/1013/200'),
      ProductModel(
          name: 'Product 6', image: 'https://picsum.photos/id/1014/200'),
      ProductModel(
          name: 'Product 7', image: 'https://picsum.photos/id/1025/200'),
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

  ProductModel({required this.name, required this.image});
}
