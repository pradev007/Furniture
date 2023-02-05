import 'package:flutter/material.dart';
import 'package:fyp/app/modules/home/views/home_view.dart';
import 'package:fyp/app/modules/navigation/views/navigation_view.dart';

import 'package:get/get.dart';

import '../../../../fypColor.dart';
import '../controllers/trending_controller.dart';

class TrendingView extends GetView<TrendingController> {
  const TrendingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TrendingView'),
          leading: IconButton(
            onPressed: (() => Get.off( HomeView())),
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
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
                // color: ColorFyp.green,
                onPressed: (() => Get.off("page")),
                icon: Icon(Icons.add_shopping_cart_sharp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
