import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/model/category_details.dart';
import 'package:fyp/app/modules/products/bindings/products_binding.dart';
import 'package:fyp/app/modules/products/controllers/products_controller.dart';
import 'package:fyp/app/modules/products/views/products_view.dart';

import 'package:get/get.dart';

import '../../../../fypColor.dart';
import '../../navigation/views/navigation_view.dart';
import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  CategoriesView({
    Key? key,
  }) : super(key: key);
  CategoriesController categoriesController = Get.find();
  // String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("categoryDetails"),
            leading: IconButton(
              onPressed: (() => Get.off(NavigationView())),
              icon: const Icon(Icons.arrow_back),
            ),
            centerTitle: true,
            backgroundColor: ColorFyp.green,
          ),
          body: FutureBuilder(
              future: categoriesController.fetchCategoryDetails(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Error Occurred"));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: categoriesController.categoryById.length,
                      itemBuilder: (context, index) {
                        CategoryByIdModel categoryByIdModel =
                            categoriesController.categoryById[index];
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            onTap: () {
                              ProductsController productsController =
                                  Get.find();
                              // productController.productDetailId =
                              //   categoryDetailsModel.productId;
                              productsController.productDetailId =
                                  categoryByIdModel.productId;
                              Get.to(() => ProductsView(),
                                  binding: ProductsBinding());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200.0,
                                    // width: double.infinity,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: ColorFyp.yellow,
                                      border: Border.all(width: 1.5),
                                      image: DecorationImage(
                                        image: NetworkImage(AppApi.urlImage +
                                            categoryByIdModel.image),
                                        fit: BoxFit.fill,
                                        // fit: BoxFit.fitWidth,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "${categoryByIdModel.productName} \nPrice: ${categoryByIdModel.price} \n ${categoryByIdModel.description}",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Center(
                                    child: Container(
                                      height: 40.0,
                                      width: 120.0,
                                      color: ColorFyp.green,
                                      child: IconButton(
                                        onPressed: () {
                                          // productController.addToCart();
                                          Get.snackbar(
                                            'Success!',
                                            'Product added to cart.',
                                            duration: Duration(seconds: 3),
                                          );
                                        },
                                        icon:
                                            Icon(Icons.add_shopping_cart_sharp),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Transform.scale(
                    scale: 1.4,
                    child: SizedBox(
                      height: Get.size.height / 1.3,
                      child: Center(
                        child: CircularProgressIndicator(
                            backgroundColor: ColorFyp.gray,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(ColorFyp.blue)),
                      ),
                    ),
                  );
                }
              })),
    );
  }
}
