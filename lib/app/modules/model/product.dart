// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

class ProductDetailModel {
    ProductDetailModel({
        required this.productId,
        required this.productName,
        required this.description,
        required this.quantity,
        required this.price,
        required this.status,
        required this.image,
        required this.categoryId,
    });

    int productId;
    String productName;
    String description;
    int quantity;
    String price;
    String status;
    String image;
    int categoryId;

    static ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

    static String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());


    factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        productId: json["product_id"],
        productName: json["product_name"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        status: json["status"],
        image: json["image"],
        categoryId: json["category_id"],
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
    };
}
