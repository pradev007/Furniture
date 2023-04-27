import 'dart:developer';

import 'package:fyp/app/modules/navigation/bindings/navigation_binding.dart';
import 'package:fyp/app/modules/utils/secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import '../navigation/views/navigation_view.dart';

class UserService extends GetxService {
  late UserModel user;
  late String userToken;

  authenticateUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    if (token != null) {
      userToken = token;
      await getUsers();
      Get.to(() => NavigationView(), binding: NavigationBinding());
    } else {
      Get.offAndToNamed('splash');
    }
  }

  Future getUsers() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? value = pref.getString('user');
    user = UserModel.userModelFromJson(value!);
  }

  static logOut() async {
    SecureStorageService secureStorageService = SecureStorageService();
    secureStorageService.delete(shouldDeleteAll: true);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Get.offNamedUntil('login', (route) => false);
  }
}
