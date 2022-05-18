import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: Get.back,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Your Cart'),
              Row(
                children: [
                  Text('Total: '),
                  Obx(() => Text('\$${controller.totalPrice}')),
                ],
              )
            ],
          ),
          SizedBox(height: 100),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.uniqueProducts.length,
              itemBuilder: (context, index) => ListTile(
                leading: Column(
                  children: [
                    Obx(
                      () => Text(
                        '${controller.getProductCount(controller.products[index]!)} X ${controller.uniqueProducts[index]!.name}',
                      ),
                    ),
                    Text('\$${controller.products[index]!.price}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
