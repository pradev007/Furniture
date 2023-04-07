// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

class Login {
    Login({
        required this.userEmail,
        required this.password,
    });

    String userEmail;
    String password;

    static Login loginFromJson(String str) => Login.fromJson(json.decode(str));

    static String loginToJson(Login data) => json.encode(data.toJson());

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        userEmail: json["user_email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "user_email": userEmail,
        "password": password,
    };
}
