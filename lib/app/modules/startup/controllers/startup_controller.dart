import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class StartupController extends GetxController {
  //TODO: Implement StartupController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Get.offAndToNamed(GetStorage('Auth').read('user_key') != null
        ? Routes.HOME
        : Routes.SIGNUP);
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
