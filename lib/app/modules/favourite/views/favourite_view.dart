import 'package:flutter/material.dart';
import 'package:fyp/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:get/get.dart';

class FavouriteView extends GetView<FavouriteController> {
  FavouriteView({Key? key}) : super(key: key);
  final FavouriteController favouriteController =
      Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        centerTitle: true,
        backgroundColor: Color(0xFF62cda7),
      ),
      body: Obx(() => ListView.builder(
            itemCount: favouriteController.favourites.length,
            itemBuilder: (context, index) {
              ProductModel product = favouriteController.favourites[index];
              return Card(
                elevation: 2,
                child: ListTile(
                  key: ValueKey(product.name),
                  leading: Image.asset(
                    'assets/images/${index + 1}.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      favouriteController.removeFromFavourites(index);
                    },
                  ),
                ),
              );
            },
          )),
    );
  }
}
