// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

class RegisterModel {
    RegisterModel({
        required this.userAddress,
        required this.userContact,
        required this.userEmail,
        required this.userName,
        required this.password,
    });

    String userAddress;
    String userContact;
    String userEmail;
    String userName;
    String password;

    static RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
    static String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        userAddress: json["user_address"],
        userContact: json["user_contact"],
        userEmail: json["user_email"],
        userName: json["user_name"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "user_address": userAddress,
        "user_contact": userContact,
        "user_email": userEmail,
        "user_name": userName,
        "password": password,
    };
}
