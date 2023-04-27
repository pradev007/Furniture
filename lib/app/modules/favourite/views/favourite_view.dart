import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:fyp/app/modules/home/bindings/home_binding.dart';
import 'package:fyp/app/modules/home/controllers/home_controller.dart';
import 'package:fyp/app/modules/model/fav_model.dart';
import 'package:get/get.dart';

import '../../../../fypColor.dart';

class FavouriteView extends GetView<FavouriteController> {
  FavouriteView({Key? key}) : super(key: key);
  final FavouriteController favouriteController =Get.put(FavouriteController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        centerTitle: true,
        backgroundColor: Color(0xFF62cda7),
      ),
      body: Obx(() => FutureBuilder(
        future: favouriteController.fetchFavorite(),
        builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Error Occurred"));
                }
                if (snapshot.hasData) {
                  
                  return ListView.builder(
              itemCount: favouriteController.favorite.length,
              itemBuilder: (context, index) {
                FavouriteModel favouriteModel =favouriteController.favorite[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Image.network(AppApi.urlImage + favouriteModel.image, width: 100,
                      height: 100,
                      fit: BoxFit.fill,),
                    title: Text(favouriteModel.productName),
                    subtitle: Text('\Rs.${favouriteModel.price}'),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: homeController.isFavorite.value
                            ? Colors.blueGrey.shade400
                            : Colors.red,
                      ),
                      onPressed: () {
                        favouriteController.deleteFavorite(favouriteModel.favouriteId);
                      },
                    ),
                  ),
                );
              },
            );}else {
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
            }
      )),
    );
  }
}
