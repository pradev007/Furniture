import 'dart:developer';
import 'dart:io';
import 'package:fyp/app/modules/model/register_model.dart';
import 'package:http/http.dart' as http;

import '../modules/model/login_model.dart';

String baseUrl = "http://172.16.18.244:3000";

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
      //if as guest authentication..
      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          //if as guest authentication
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
}
