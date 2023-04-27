import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../const/app_api.dart';
import '../../model/fav_model.dart';
import '../../utils/helpers.dart';
import '../../utils/user_service.dart';

class FavouriteController extends GetxController {
  var favorite = <FavouriteModel>[];
  UserService user = Get.find();
  final isFavorite = false.obs;
  
  fetchFavorite() async {
    try {
      http.Response response =
          await AuthApiServices().fetchFavorites(user.userToken);
      // log(response.body);
      var body = response.body;
      var responseBody = jsonDecode(body);
      if (response.statusCode == 200 && response.statusCode <= 300) {
        favorite = FavouriteModel.favouriteModelFromJson(body);
        update();
      } else if (response.statusCode == 400 && response.statusCode < 500) {
        Helpers.showToastMessage(message: responseBody['message']);
      } else {
        throw Exception();
      }
    } catch (e) {
      // log(e.toString());
      print("Line number 35: ${e.toString()}");
    }
  }

    deleteFavorite(int favoriteID) async {
    try {
      http.Response response =
          await AuthApiServices().removeFavorite(favoriteID, user.userToken);
      var body = response.body;
      var responseBody = jsonDecode(body);

      if (response.statusCode == 200 && response.statusCode <= 300) {
        isFavorite(true);

        Helpers.showToastMessage(message: responseBody["message"]);
        update();
      } else if (response.statusCode == 400 && response.statusCode < 500) {
        Helpers.showToastMessage(message: responseBody['message']);
      } else {
        throw Exception();
      }
    } catch (e) {
      // log(e.toString());
      Future.error(e.toString());
    }
  }
}