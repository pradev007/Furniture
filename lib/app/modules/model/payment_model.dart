import 'dart:convert';

class PaymentModel {
  PaymentModel({
    required this.amount,
    required this.mobile,
    required this.userAddress,
    required this.city
  });

  int amount;
  String mobile;
  String userAddress;
  String city;

  static PaymentModel paymentModelFromJson(String str) =>
      PaymentModel.fromJson(json.decode(str));

  static String paymentModelToJson(PaymentModel data) =>
      json.encode(data.toJson());

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        amount: json["amount"],
        mobile: json["mobile"],
        userAddress: json["userAddress"],
        city: json["city"]
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "mobile": mobile,
        "userAddress": userAddress,
        "city": city
      };
}
