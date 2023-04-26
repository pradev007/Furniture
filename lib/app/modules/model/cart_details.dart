// To parse this JSON data, do
//
//     final cartDetailsModel = cartDetailsModelFromJson(jsonString);

import 'dart:convert';

class CartDetailsModel {
    CartDetailsModel({
        required this.cartDetailsModelProductId,
        required this.productName,
        required this.description,
        required this.price,
        required this.status,
        required this.image,
        required this.categoryId,
        required this.quantity,
        required this.cartId,
        required this.userId,
        required this.productId,
        required this.totalPrice,
    });

    int cartDetailsModelProductId;
    String productName;
    String description;
    int price;
    int status;
    String image;
    int categoryId;
    int quantity;
    int cartId;
    int userId;
    int productId;
    int totalPrice;

    static List<CartDetailsModel> cartDetailsModelFromJson(String str) => List<CartDetailsModel>.from(json.decode(str).map((x) => CartDetailsModel.fromJson(x)));

    static String cartDetailsModelToJson(List<CartDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    factory CartDetailsModel.fromJson(Map<String, dynamic> json) => CartDetailsModel(
        cartDetailsModelProductId: json["product_id"],
        productName: json["product_name"],
        description: json["description"],
        price: json["price"],
        status: json["status"],
        image: json["image"],
        categoryId: json["category_id"],
        quantity: json["quantity"],
        cartId: json["cartID"],
        userId: json["userID"],
        productId: json["productID"],
        totalPrice: json["totalPrice"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": cartDetailsModelProductId,
        "product_name": productName,
        "description": description,
        "price": price,
        "status": status,
        "image": image,
        "category_id": categoryId,
        "quantity": quantity,
        "cartID": cartId,
        "userID": userId,
        "productID": productId,
        "totalPrice": totalPrice,
    };
}
