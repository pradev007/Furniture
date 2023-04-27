// To parse this JSON data, do
//
//     final addressDetailsModel = addressDetailsModelFromJson(jsonString);

import 'dart:convert';

class AddressDetailsModel {
    int addressId;
    int userId;
    String userAddress;
    String city;
    String mobile;

    AddressDetailsModel({
        required this.addressId,
        required this.userId,
        required this.userAddress,
        required this.city,
        required this.mobile,
    });

    static List<AddressDetailsModel> addressDetailsModelFromJson(String str) => List<AddressDetailsModel>.from(json.decode(str).map((x) => AddressDetailsModel.fromJson(x)));

    static String addressDetailsModelToJson(List<AddressDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    factory AddressDetailsModel.fromJson(Map<String, dynamic> json) => AddressDetailsModel(
        addressId: json["addressID"],
        userId: json["userID"],
        userAddress: json["userAddress"],
        city: json["city"],
        mobile: json["mobile"],
    );

    Map<String, dynamic> toJson() => {
        "addressID": addressId,
        "userID": userId,
        "userAddress": userAddress,
        "city": city,
        "mobile": mobile,
    };
}
