import 'package:flutter/material.dart';
import 'package:fyp/app/modules/categories/controllers/categories_controller.dart';
import 'package:fyp/fypColor.dart';
import 'package:get/get.dart';

class CartButton extends StatelessWidget {
  CartButton({Key? key, required this.productID}) : super(key: key);
  final int productID;
  CategoriesController categoriesController = CategoriesController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40.0,
        width: 120.0,
        color: ColorFyp.green,
        child: IconButton(
          onPressed: () {
            Get.showOverlay(asyncFunction: () async {
              await categoriesController.addCarts(productID);
            });

            // productController.addToCart();
            // Get.snackbar(
            //   'Success!',
            //   'Product added to cart.',
            //   duration: Duration(seconds: 3),
            // );
          },
          icon: Icon(Icons.add_shopping_cart_sharp),
        ),
      ),
    );
  }
}
