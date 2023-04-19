// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

class CategoryModel {
    CategoryModel({
        required this.catId,
        required this.type,
        required this.image,
    });

    int catId;
    String type;
    String image;

    static List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

    static String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        catId: json["category_id"],
        type: json["category_name"],
        image: json["category_image"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": catId,
        "category_name": type,
        "category_image": image,
    };
}