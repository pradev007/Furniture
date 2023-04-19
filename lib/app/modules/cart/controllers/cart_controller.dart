import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemModel {
  int id;
  final String name;
  // final String imageUrl;
  final double price;
  int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    // required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

class CartController extends GetxController {
  var cartItems = <CartItemModel>[
    CartItemModel(
      id: 1,
      name: 'Product 1',
      // imageUrl: 'https://picsum.photos/id/1015/200',
      price: 9.99,
      quantity: 1,
    ),
    CartItemModel(
      id: 2,
      name: 'Product 2',
      // imageUrl: 'https://picsum.photos/id/1018/200',
      price: 14.99,
      quantity: 2,
    ),
    CartItemModel(
      id: 3,
      name: 'Product 3',
      // imageUrl: 'https://picsum.photos/id/1020/200',
      price: 19.99,
      quantity: 3,
    ),
    CartItemModel(
      id: 4,
      name: 'Product 4',
      // imageUrl: 'https://picsum.photos/id/1025/200',
      price: 24.99,
      quantity: 4,
    ),
    CartItemModel(
      id: 5,
      name: 'Dining Table',
      // imageUrl: 'https://picsum.photos/id/1026/200',
      price: 50,
      quantity: 1,
    ),
  ].obs;

  double get totalCost =>
      cartItems.fold(0, (total, item) => total + (item.price * item.quantity));

  void addToCart(CartItemModel cartItem) {
    final index = cartItems.indexWhere((item) => item.id == cartItem.id);
    if (index == -1) {
      cartItems.add(cartItem);
    } else {
      cartItems[index].quantity += cartItem.quantity;
    }
  }

  void incrementQuantity(int index) {
    cartItems[index].quantity++;
    update();
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
    } else {
      cartItems.removeAt(index);
    }
  }
}
