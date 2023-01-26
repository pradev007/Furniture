import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.extent(
        maxCrossAxisExtent: 150.0,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 8.0,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: ColorFyp.gray,
              border: Border.all(width: 1.5, strokeAlign: StrokeAlign.outside),
              image: const DecorationImage(
                image: AssetImage('assets/images/bed.jpg'),
                // fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text("Photos1"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: ColorFyp.gray,
              border: Border.all(width: 1.5, strokeAlign: StrokeAlign.outside),
              image: const DecorationImage(
                image: AssetImage('assets/images/bed.jpg'),
                alignment: Alignment.topCenter,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text("Photos"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: ColorFyp.gray,
              border: Border.all(width: 1.5, strokeAlign: StrokeAlign.outside),
              image: const DecorationImage(
                image: AssetImage('assets/images/bed.jpg'),
                alignment: Alignment.topCenter,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text("Photos"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: ColorFyp.gray,
              border: Border.all(width: 1.5, strokeAlign: StrokeAlign.outside),
              image: const DecorationImage(
                image: AssetImage('assets/images/bed.jpg'),
                alignment: Alignment.topCenter,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text("Photos"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: ColorFyp.gray,
              border: Border.all(width: 1.5, strokeAlign: StrokeAlign.outside),
              image: const DecorationImage(
                image: AssetImage('assets/images/bed.jpg'),
                alignment: Alignment.topCenter,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text("Photos"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: ColorFyp.gray,
              border: Border.all(width: 1.5, strokeAlign: StrokeAlign.outside),
              image: const DecorationImage(
                image: AssetImage('assets/images/bed.jpg'),
                alignment: Alignment.topCenter,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text("Photos"),
            ),
          ),
        ],
      ),
    );
  }
}
