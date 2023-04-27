// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

class OrderDetailsModel {
    int orderDetailsModelProductId;
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
    int orderId;
    int paymentId;
    int addressId;

    OrderDetailsModel({
        required this.orderDetailsModelProductId,
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
        required this.orderId,
        required this.paymentId,
        required this.addressId,
    });

    static List<OrderDetailsModel> orderDetailsModelFromJson(String str) => List<OrderDetailsModel>.from(json.decode(str).map((x) => OrderDetailsModel.fromJson(x)));

    static String orderDetailsModelToJson(List<OrderDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
        orderDetailsModelProductId: json["product_id"],
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
        orderId: json["orderID"],
        paymentId: json["paymentID"],
        addressId: json["addressID"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": orderDetailsModelProductId,
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
        "orderID": orderId,
        "paymentID": paymentId,
        "addressID": addressId,
    };
}
