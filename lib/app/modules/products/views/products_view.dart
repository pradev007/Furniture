import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/app/modules/cart/views/cart_view.dart';
import 'package:fyp/app/modules/home/views/home_view.dart';
import 'package:fyp/app/modules/model/product.dart';

import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';
import '../../../const/app_api.dart';
import '../../navigation/views/navigation_view.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  ProductsView({Key? key}) : super(key: key);
  ProductsController productsController = Get.find();
  // final HomeView pv = HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
          leading: IconButton(
            onPressed: (() => Get.off(NavigationView())),
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          backgroundColor: ColorFyp.green,
        ),
        body: FutureBuilder(
            future: productsController.fetchProductDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Error Occurred"));
              }
              if (snapshot.hasData) {
                ProductDetailModel productDetailModel =
                    productsController.productDetailModel;
                return Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.network(
                            AppApi.urlImage + productDetailModel.image)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    productDetailModel.productName,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: ColorFyp.brown),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border_rounded,
                                        color: ColorFyp.gray,
                                      )),
                                ],
                              ),
                              // Gap(16.0),
                              Text(
                                "Description:",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: ColorFyp.brown),
                              ),
                              // Gap(16.0),
                              Text(productDetailModel.description),
                              // Gap(4.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Quantity",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: ColorFyp.brown),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(0, 1),
                                                    blurRadius: 6)
                                              ]),
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: const Text("1",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(0, 1),
                                                    blurRadius: 6)
                                              ]),
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              // const Gap(12.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Rs.",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: ColorFyp.brown),
                                      ),
                                      // Gap(6.0),
                                      Text(
                                        productDetailModel.price,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: ColorFyp.brown),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorFyp.green,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.shopping_cart_outlined,
                                              color: ColorFyp.white,
                                            ),
                                            // const Gap(12),
                                            Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                  color: ColorFyp.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    )
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(padding: const EdgeInsets.all(15.0)),
                    // ),

                    // // price of the product
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 50.0),
                    //   child: Text(
                    //     "Rs. 25,000",
                    //     style: TextStyle(
                    //         fontSize: 25.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.yellow[900]),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 100.0,
                    // ),
                    // Container(
                    //   height: 150.0,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: ColorFyp.black,
                    //     borderRadius: const BorderRadius.only(
                    //       topLeft: Radius.circular(10.0),
                    //       topRight: Radius.circular(10.0),
                    //     ),
                    //     // border: Border.all(color: Colors.blueAccent)
                    //   ),
                    //   child: Align(
                    //     alignment: Alignment.bottomCenter,
                    //     child: Row(
                    //       children: [
                    //         // buy now elevated button
                    //         Container(
                    //           padding: const EdgeInsets.only(left: 90.0),
                    //           child: ElevatedButton(
                    //             onPressed: (() => Get.off(CartView())),
                    //             style: ButtonStyle(
                    //                 backgroundColor:
                    //                     MaterialStateProperty.all(Colors.amber)),
                    //             child:
                    //                 const Hero(tag: 'trends1', child: Text("Buy Now")),
                    //           ),
                    //         ),
                    //         Expanded(child: Container()),
                    //         // add to cart elevated button
                    //         Container(
                    //           padding: const EdgeInsets.only(right: 50.0),
                    //           child: ElevatedButton(
                    //             onPressed: (() => Get.off(
                    //                   CartView(),
                    //                 )),
                    //             style: ButtonStyle(
                    //                 backgroundColor:
                    //                     MaterialStateProperty.all(Colors.green)),
                    //             child: const Icon(
                    //               Icons.add_shopping_cart,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                );
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
            }));
  }
}
