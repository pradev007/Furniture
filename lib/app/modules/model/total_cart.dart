// To parse this JSON data, do
//
//     final cartNumberModel = cartNumberModelFromJson(jsonString);

import 'dart:convert';

class CartNumberModel {
    CartNumberModel({
        required this.cartNumber,
        required this.totalPrice,
    });

    int cartNumber;
    int totalPrice;

    static CartNumberModel cartNumberModelFromJson(String str) => CartNumberModel.fromJson(json.decode(str));

    static String cartNumberModelToJson(CartNumberModel data) => json.encode(data.toJson());

    factory CartNumberModel.fromJson(Map<String, dynamic> json) => CartNumberModel(
        cartNumber: json["cartNumber"],
        totalPrice: json["totalPrice"],
    );

    Map<String, dynamic> toJson() => {
        "cartNumber": cartNumber,
        "totalPrice": totalPrice,
    };
}
