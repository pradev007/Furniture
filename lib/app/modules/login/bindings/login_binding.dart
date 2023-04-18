import 'package:get/get.dart';

import '../../signup/controllers/signup_controller.dart';
import '../../splash/controllers/splash_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
