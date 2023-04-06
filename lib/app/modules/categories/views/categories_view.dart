import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../fypColor.dart';
import '../../cart/views/cart_view.dart';
import '../../navigation/views/navigation_view.dart';
import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  CategoriesView({Key? key}) : super(key: key);
  final productController = Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          leading: IconButton(
            onPressed: (() => Get.off(NavigationView())),
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          backgroundColor: ColorFyp.green,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Container(
              height: 200.0,
              // width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: ColorFyp.yellow,
                border:
                    Border.all(width: 1.5, strokeAlign: StrokeAlign.outside),
                image: const DecorationImage(
                  image: AssetImage('assets/images/sofa.jpg'),
                  // fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const Text(
              "Sofa Set \nPrice: 25,000 \nother description",
              style: TextStyle(decoration: TextDecoration.none, fontSize: 20.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 40.0,
              width: 10.0,
              color: ColorFyp.green,
              child: IconButton(
                onPressed: () {
                  productController.addToCart();
                  Get.snackbar(
                    'Success!',
                    'Product added to cart.',
                    duration: Duration(seconds: 3),
                  );
                },
                icon: Icon(Icons.add_shopping_cart_sharp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
