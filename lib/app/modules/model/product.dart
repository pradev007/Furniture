// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

class ProductDetails {
  ProductDetails({
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

  static ProductDetails productDetailsFromJson(String str) =>
      ProductDetails.fromJson(json.decode(str));

  static String productDetailsToJson(ProductDetails data) =>
      json.encode(data.toJson());

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
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
        "cat_id": catId,
        "quantity": quantity,
      };
}
