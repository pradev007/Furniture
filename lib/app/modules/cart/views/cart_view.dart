import 'package:flutter/material.dart';
import 'package:fyp/fypColor.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  CartView({Key? key}) : super(key: key);
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        backgroundColor: Color(0xFF62cda7),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.cartItems.length + 1,
          itemBuilder: (context, index) {
            if (index == controller.cartItems.length) {
              return Card(
                elevation: 2,
                color: ColorFyp.yellow,
                child: ListTile(
                  title: Text(
                    'Total:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  trailing:
                      Text('\$${controller.totalCost.toStringAsFixed(2)}'),
                ),
              );
            }

            final cartItem = controller.cartItems[index];
            return ListTile(
              leading: Image.network(cartItem.imageUrl),
              title: Text(cartItem.name),
              subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.decrementQuantity(index);
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text(cartItem.quantity.toString()),
                  IconButton(
                    onPressed: () {
                      controller.incrementQuantity(index);
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(26.0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.deepOrangeAccent)),
          onPressed: () {
            // TODO: Navigate to the payment screen
          },
          child: Text(
            'Proceed to Payment',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
