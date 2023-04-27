import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fyp/app/modules/model/register_model.dart';
import 'package:http/http.dart' as http;

import '../modules/model/login_model.dart';

String baseUrl = "http://172.16.16.160:3000";

class AppApi {
  static AuthApis authApis = AuthApis();
  static String urlImage = "$baseUrl/images/";
}

class AuthApis {
  AuthApis();
  String get userRegister => "$baseUrl/api/users/register";
  String get userLogin => "$baseUrl/api/users/login";
  String get category => "$baseUrl/api/products/fetch/category";
  String get categoryDetail => "$baseUrl/api/products/fetch/category";
  String get productDetails => "$baseUrl/api/products/getProducts";
  String get latestProducts => "$baseUrl/api/products/fetch/latest";
  String get addCart => "$baseUrl/api/products/carts";
  String get cartDetails => "$baseUrl/api/products/fetch/cart";
  String get totalCart => "$baseUrl/api/products/cart/number";
  String get increaseQuantity => "$baseUrl/api/products/carts";
  String get descreaseQuantity => "$baseUrl/api/products/carts";
  String get favourite => "$baseUrl/api/favorite";
  String get favouriteDetails => "$baseUrl/api/favorite";
  String get removeFavorite => "$baseUrl/api/favorite";
}

class AuthApiServices {
  var client = http.Client();
  Future registerUser(RegisterModel registerModel) async {
    try {
      Uri url = Uri.parse(AuthApis().userRegister);
      log(url.toString());
      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: RegisterModel.registerModelToJson(registerModel),
      );
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error("line 42:" + error.toString());
    }
  }

  Future loginUser(Login login) async {
    try {
      Uri url = Uri.parse(AuthApis().userLogin);
      log(url.toString());
      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: Login.loginToJson(login),
      );
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      log(error.toString());
      return Future.error(error.toString());
    }
  }

  Future categories() async {
    try {
      Uri url = Uri.parse(AuthApis().category);
      var response = await client.get(url);
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  Future categoryById(int categoryId) async {
    try {
      Uri url = Uri.parse("${AuthApis().categoryDetail}/$categoryId");
      var response = await client.get(url);
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  Future product(int productDetailId) async {
    try {
      Uri url = Uri.parse("${AuthApis().productDetails}/$productDetailId");
      var response = await client.get(url);
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  Future latestProduct() async {
    try {
      Uri url = Uri.parse(AuthApis().latestProducts);
      var response = await client.get(url);
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  Future addToCart(int productID, String token) async {
    try {
      Uri url = Uri.parse(AuthApis().addCart);

      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"productID": productID}),
      );
      return response;
    } on SocketException {
      return Future.error('Backend is not runnning');
    } on FormatException {
      return Future.error('Bad respose format');
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future cartDetail(String token) async {
    try {
      Uri url = Uri.parse(
        AuthApis().cartDetails,
      );
      // log(url.toString());

      var response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      // log(response.body);
      return response;
    } on SocketException {
      return Future.error('Backend is not runnning');
    } on FormatException {
      return Future.error('Bad respose format');
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future totalCarts(String token) async {
    try {
      Uri url = Uri.parse(
        AuthApis().totalCart,
      );
      // log(url.toString());

      var response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      // log(response.body);
      return response;
    } on SocketException {
      return Future.error('Backend is not runnning');
    } on FormatException {
      return Future.error('Bad respose format');
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future increaseCartQuantity(String token, int increaseId) async {
    try {
      Uri url = Uri.parse(
        "${AuthApis().increaseQuantity}/$increaseId/increase",
      );
      log(url.toString());

      var response = await client.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      // log(response.body);
      return response;
    } on SocketException {
      return Future.error('Backend is not runnning');
    } on FormatException {
      return Future.error('Bad respose format');
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future decreaseCartQuantity(String token, int decreaseId) async {
    try {
      Uri url = Uri.parse(
        "${AuthApis().descreaseQuantity}/$decreaseId/decrease",
      );
      // log(url.toString());

      var response = await client.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      // log(response.body);
      return response;
    } on SocketException {
      return Future.error('Backend is not runnning');
    } on FormatException {
      return Future.error('Bad respose format');
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future addFavorite(int productID, String token) async {
    try {
      Uri url = Uri.parse(AuthApis().favourite);

      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"product_id": productID}),
      );
      return response;
    } on SocketException {
      return Future.error('Backend is not runnning');
    } on FormatException {
      return Future.error('Bad respose format');
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future fetchFavorites(String token) async {
    try {
      Uri url = Uri.parse(
        AuthApis().favouriteDetails,
      );
      // log(url.toString());

      var response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      // log(response.body);
      return response;
    } on SocketException {
      return Future.error('Backend is not runnning');
    } on FormatException {
      return Future.error('Bad respose format');
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future removeFavorite(int favoriteID, String token) async {
    try {
      Uri url = Uri.parse("${AuthApis().removeFavorite}/$favoriteID");
      var response = await client.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      return response;
    } on SocketException {
      return Future.error('Backend is not runnning');
    } on FormatException {
      return Future.error('Bad respose format');
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
