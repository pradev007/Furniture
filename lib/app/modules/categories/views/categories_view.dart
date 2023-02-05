import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../navigation/views/navigation_view.dart';
import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: Text("This is the Main Page"),
      bottomNavigationBar: NavigationView(),
    );
  }
}
