import 'package:get/get.dart';

import '../../categories/controllers/categories_controller.dart';
import '../../products/controllers/products_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
    Get.lazyPut<ProductsController>(
      () => ProductsController(),
    );
  }
}
