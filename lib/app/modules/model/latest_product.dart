// To parse this JSON data, do
//
//     final latestArrivalModel = latestArrivalModelFromJson(jsonString);

import 'dart:convert';

class LatestArrivalModel {
    LatestArrivalModel({
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

    static List<LatestArrivalModel> latestArrivalModelFromJson(String str) => List<LatestArrivalModel>.from(json.decode(str).map((x) => LatestArrivalModel.fromJson(x)));

    static String latestArrivalModelToJson(List<LatestArrivalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


    factory LatestArrivalModel.fromJson(Map<String, dynamic> json) => LatestArrivalModel(
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
