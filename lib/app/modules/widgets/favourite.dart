import 'package:flutter/material.dart';
import 'package:fyp/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:fyp/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class FavouriteTile extends StatelessWidget {
  FavouriteTile(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      this.favoriteID})
      : super(key: key);
  final String name;
  final String image;
  final String price;
  final int? favoriteID;

  HomeController homeController = Get.put(HomeController());
  FavouriteController favouriteController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.network(
          image,
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        title: Text(name),
        subtitle: Text('\Rs.${price}'),
        trailing: IconButton(
          icon: Icon(
            Icons.favorite,
            color: favouriteController.isFavorite.value
                ? Colors.blueGrey.shade400
                : Colors.red,
          ),
          onPressed: () {
            favouriteController.deleteFavorite(favoriteID!);
          },
        ),
      ),
    );
  }
}
