import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moms_food_corner/app/controllers/cart_controller.dart';
import 'package:moms_food_corner/app/modules/home/controllers/profile_controller.dart';
import 'package:moms_food_corner/app/modules/home/views/combo_products_view.dart';
import 'package:moms_food_corner/app/modules/home/views/single_products_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../controllers/page_view_controller.dart';

class HomeView extends GetView<HomeController> {
  final _profileController = Get.find<ProfileController>();
  final _cartController = Get.find<CartController>();
  final _pageController = Get.find<PageViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: 5),
            CircleAvatar(),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _profileController.currentUser?.username ?? 'N/A',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  _profileController.currentUser?.username ?? 'N/A',
                  style: TextStyle(
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
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: Obx(
              () => Text(
                _cartController.total.toString(),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Obx(
              () => ButtonBar(
                buttonPadding: EdgeInsets.symmetric(horizontal: 5),
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextButton(
                    onPressed: () => _pageController.toPage(0),
                    label: 'Single',
                    isActive: _pageController.isFirstActive,
                  ),
                  CustomTextButton(
                    onPressed: () => _pageController.toPage(1),
                    label: 'Combo',
                    isActive: _pageController.isSecondActive,
                  ),
                ],
              ).paddingSymmetric(vertical: 10),
            ),
          ).paddingSymmetric(vertical: 30),
          Expanded(
            child: PageView(
              onPageChanged: _pageController.toPage,
              physics: BouncingScrollPhysics(),
              controller: _pageController.controller,
              children: [
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
        child: Text(
          label,
          textScaleFactor: 1.3,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
      ),
    );
  }
}
