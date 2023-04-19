// To parse this JSON data, do
//
//     final categoryByIdModel = categoryByIdModelFromJson(jsonString);

import 'dart:convert';

class CategoryByIdModel {
  CategoryByIdModel({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.status,
    required this.image,
    required this.catId,
    required this.quantity,
  });

  int productId;
  String productName;
  String description;
  String price;
  String status;
  String image;
  int catId;
  int quantity;

  static List<CategoryByIdModel> categoryByIdModelFromJson(String str) =>
      List<CategoryByIdModel>.from(
          json.decode(str).map((x) => CategoryByIdModel.fromJson(x)));

  static String categoryByIdModelToJson(List<CategoryByIdModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory CategoryByIdModel.fromJson(Map<String, dynamic> json) =>
      CategoryByIdModel(
        productId: json["product_id"],
        productName: json["product_name"],
        description: json["description"],
        price: json["price"],
        status: json["status"],
        image: json["image"],
        catId: json["category_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "description": description,
        "price": price,
        "status": status,
        "image": image,
        "category_id": catId,
        "quantity": quantity,
      };
}
