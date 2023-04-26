import 'package:get/get.dart';

import '../../utils/user_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initializeAppResources();
  }

  initializeAppResources() async {
    final UserService userService = Get.put(UserService());
    await userService.authenticateUser();
  }
}
