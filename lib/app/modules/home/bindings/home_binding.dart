import 'package:get/get.dart';
import '../../categories/controllers/categories_controller.dart';
import '../../navigation/controllers/navigation_controller.dart';
import '../../products/controllers/products_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProductsController>(
      () => ProductsController(),
    );
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
  }
}
