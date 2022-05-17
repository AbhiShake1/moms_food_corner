import 'package:get/get.dart';
import 'package:moms_food_corner/app/data/providers/user_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    UserProvider()
        .getUser(username: 'abhi@email.co')
        .then((value) => print(value.username));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
