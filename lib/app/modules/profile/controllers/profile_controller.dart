import 'package:fyp/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // other code...

  void logout() {
    // clear user data or any other data
    // and navigate to the login page
    // You can replace the LoginPage with your desired login page
    Get.offAll(() => LoginView());
  }
}
