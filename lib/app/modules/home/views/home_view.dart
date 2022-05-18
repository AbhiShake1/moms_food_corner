import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moms_food_corner/app/controllers/cart_controller.dart';
import 'package:moms_food_corner/app/modules/home/controllers/profile_controller.dart';
import 'package:moms_food_corner/app/modules/home/views/combo_products_view.dart';
import 'package:moms_food_corner/app/modules/home/views/single_products_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../controllers/page_view_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final cartController = Get.find<CartController>();
    final pageController = Get.find<PageViewController>();
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(width: 5),
            const CircleAvatar(),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  profileController.currentUser?.username ?? 'N/A',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  profileController.currentUser?.username ?? 'N/A',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () => Get.toNamed(Routes.CART),
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            label: Obx(
              () => Text(
                cartController.total.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Obx(
              () => ButtonBar(
                buttonPadding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextButton(
                    onPressed: () => pageController.toPage(0),
                    label: 'Single',
                    isActive: pageController.isFirstActive,
                  ),
                  CustomTextButton(
                    onPressed: () => pageController.toPage(1),
                    label: 'Combo',
                    isActive: pageController.isSecondActive,
                  ),
                ],
              ).paddingSymmetric(vertical: 10),
            ),
          ).paddingSymmetric(vertical: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'TODAY\'S DEAL',
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ).paddingAll(15),
                    const Text(
                      'Chicken Bucket',
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ).paddingAll(15),
                    const Text(
                      '2pm-10pm',
                      textScaleFactor: 1.3,
                    ).paddingAll(15),
                  ],
                ),
                Lottie.asset('assets/burger_lottie.json', width: 200),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: pageController.toPage,
              physics: const BouncingScrollPhysics(),
              controller: pageController.controller,
              children: const [
                SingleProductsView(),
                ComboProductsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.isActive,
    this.activeBackgroundColor = Colors.white,
    this.inactiveBackgroundColor = Colors.transparent,
  }) : super(key: key);

  final void Function() onPressed;
  final String label;
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? activeBackgroundColor : inactiveBackgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(
          label,
          textScaleFactor: 1.3,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
