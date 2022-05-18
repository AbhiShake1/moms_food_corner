import 'package:get/get.dart';

import 'package:moms_food_corner/app/controllers/cart_controller.dart';
import 'package:moms_food_corner/app/modules/home/controllers/page_view_controller.dart';
import 'package:moms_food_corner/app/modules/home/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageViewController>(
      () => PageViewController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
