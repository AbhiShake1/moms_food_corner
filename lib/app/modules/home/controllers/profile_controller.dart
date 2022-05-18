import 'package:get/get.dart';
import 'package:moms_food_corner/app/data/models/user_model.dart';
import 'package:moms_food_corner/app/data/providers/user_provider.dart';

class ProfileController extends GetxController {
  final _provider = UserProvider();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  User? get currentUser => _provider.currentUser;
}
