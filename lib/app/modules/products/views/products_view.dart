import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/app/modules/cart/views/cart_view.dart';
import 'package:fyp/app/modules/home/views/home_view.dart';

import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  ProductsView({Key? key}) : super(key: key);
  final HomeView pv = HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product View"),
        leading: IconButton(
          onPressed: (() => Get.off(HomeView())),
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.amber),
        ),
        backgroundColor: ColorFyp.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: HomeView().displayImageAndText(
                    'assets/images/bed.jpg',
                    "Luxury King Sized Bed",
                    "Typically measures 76 inches wide by 80 inches long",
                    "High-end bed designed for maximum comfort and style",
                    "Features premium materials such as high-end fabrics, plush padding, and sturdy frames",
                    "Elegant and sophisticated design elements"),
              ),
            ),

            // price of the product
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                "Rs. 25,000",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow[900]),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorFyp.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                // border: Border.all(color: Colors.blueAccent)
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    // buy now elevated button
                    Container(
                      padding: const EdgeInsets.only(left: 90.0),
                      child: ElevatedButton(
                        onPressed: (() => Get.off(CartView())),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber)),
                        child:
                            const Hero(tag: 'trends1', child: Text("Buy Now")),
                      ),
                    ),
                    Expanded(child: Container()),
                    // add to cart elevated button
                    Container(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: ElevatedButton(
                        onPressed: (() => Get.off(
                              CartView(),
                            )),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        child: const Icon(
                          Icons.add_shopping_cart,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
