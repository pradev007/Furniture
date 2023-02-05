import 'package:flutter/material.dart';
import 'package:fyp/app/modules/products/views/products_view.dart';
import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: F,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              // indicator: BoxDecoration(color: ColorFyp.yellow),
              automaticIndicatorColorAdjustment: true,
              unselectedLabelColor: Color.fromARGB(94, 0, 0, 0),
              indicatorWeight: 5.0,
              indicatorColor: Colors.amber,
              labelColor: Colors.amber,

              tabs: [
                Tab(
                  child: Text(
                    "Latest",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      // color: Colors.red
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "History",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text("Cart"),
            leading: IconButton(
                onPressed: (() => Get.off(ProductsView)),
                icon: const Icon(Icons.arrow_back)),
            centerTitle: true,
          ),
          
          body: const TabBarView(
            children: [
              Center(
                child: Text(
                  "Oldest",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Center(
                child: Text("Newest"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
