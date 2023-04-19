import 'package:fyp/app/modules/categories/controllers/categories_controller.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    
  }
}
