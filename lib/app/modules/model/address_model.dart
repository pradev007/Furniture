// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

class AddressModel {
  int? addressId;
  int? userId;
  String userAddress;
  String city;
  String mobile;

  AddressModel({
    this.addressId,
    this.userId,
    required this.userAddress,
    required this.city,
    required this.mobile,
  });

  static AddressModel addressModelFromJson(String str) =>
      AddressModel.fromJson(json.decode(str));

  static String addressModelToJson(AddressModel data) =>
      json.encode(data.toJson());

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
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
