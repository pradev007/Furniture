// To parse this JSON data, do
//
//     final favouriteModel = favouriteModelFromJson(jsonString);

import 'dart:convert';

class FavouriteModel {
  FavouriteModel({
    required this.productId,
    required this.productName,
    required this.description,
    required this.quantity,
    required this.price,
    required this.status,
    required this.image,
    required this.categoryId,
    required this.favouriteId,
    required this.userId,
  });

  int productId;
  String productName;
  String description;
  int quantity;
  String price;
  String status;
  String image;
  int categoryId;
  int favouriteId;
  int userId;

  static List<FavouriteModel> favouriteModelFromJson(String str) =>
      List<FavouriteModel>.from(
          json.decode(str).map((x) => FavouriteModel.fromJson(x)));

  static String favouriteModelToJson(List<FavouriteModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        productId: json["product_id"],
        productName: json["product_name"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        status: json["status"],
        image: json["image"],
        categoryId: json["category_id"],
        favouriteId: json["favourite_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "description": description,
        "quantity": quantity,
        "price": price,
        "status": status,
        "image": image,
        "category_id": categoryId,
        "favourite_id": favouriteId,
        "user_id": userId,
      };
}
