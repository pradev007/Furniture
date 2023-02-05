import 'package:get/get.dart';

import '../controllers/shop_now_controller.dart';

class ShopNowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopNowController>(
      () => ShopNowController(),
    );
  }
}
