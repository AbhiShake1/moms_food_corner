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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Cart',
                textScaleFactor: 3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ).paddingAll(20),
              Row(
                children: [
                  Text(
                    'Total: ',
                    textScaleFactor: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(
                    () => Text(
                      '\$${controller.totalPrice}',
                      textScaleFactor: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ).paddingAll(20),
            ],
          ),
          SizedBox(height: 100),
          Expanded(
            //must make entire listview observable as the whole thing has to be removed if 0
            child: Obx(
              () => ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.totalUnique,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${controller.getProductCount(controller.uniqueProducts[index])} X ${controller.uniqueProducts[index]!.name}',
                          ),
                          Text('\$${controller.products[index]!.price}'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (controller.products[index] != null) {
                                controller.removeFromCart(
                                    controller.uniqueProducts[index]!);
                              }
                            },
                            icon: Icon(Icons.remove_circle),
                          ),
                          IconButton(
                            onPressed: () => controller
                                .addToCart(controller.uniqueProducts[index]!),
                            icon: Icon(Icons.add_circle),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Continue To Checkout',
              textScaleFactor: 2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ).paddingAll(15),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
