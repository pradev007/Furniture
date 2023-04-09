import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../products/controllers/products_controller.dart';
import '../controllers/categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProductsController>(
      () => ProductsController(),
    );
  }
}
