// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class UserModel {
    UserModel({
        required this.userId,
        required this.userName,
        required this.userEmail,
        required this.userContact,
        required this.password,
    });

    int userId;
    String userName;
    String userEmail;
    String userContact;
    String password;

    static UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

    static String userModelToJson(UserModel data) => json.encode(data.toJson());
    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userContact: json["user_contact"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "user_contact": userContact,
        "password": password,
    };
}
