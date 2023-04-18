import 'package:fyp/app/modules/categories/controllers/categories_controller.dart';
import 'package:fyp/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../products/controllers/products_controller.dart';
import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );

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
