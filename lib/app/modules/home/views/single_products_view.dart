import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moms_food_corner/app/controllers/cart_controller.dart';

class SingleProductsView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: state?.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (_, index) => GestureDetector(
            child: Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (state?[index] != null)
                    Column(
                      children: [
                        Lottie.asset('assets/burger_lottie.json', width: 100),
                        SizedBox(height: 10),
                        Text(
                          state![index]?.name ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(state[index]?.description ?? ''),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '\$${state[index]?.price.toString() ?? ''}',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      controller.removeFromCart(state[index]!),
                                  icon: Icon(Icons.remove_circle),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      controller.addToCart(state[index]!),
                                  icon: Icon(Icons.add_circle),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                ],
              ),
            ),
            onTap: () {
              if (state?[index] != null) {
                controller.addToCart(state![index]!);
              }
            },
          ),
        ),
      ),
    );
  }
}
