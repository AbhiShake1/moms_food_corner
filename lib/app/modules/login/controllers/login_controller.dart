import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moms_food_corner/app/data/providers/user_provider.dart';

import '../../../data/models/user_model.dart';

class LoginController extends GetxController {
  final _provider = UserProvider();

  final isLoading = false.obs;
  late final TextEditingController emailController, passwordController;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<User?> login() async {
    try {
      isLoading.value = true;
      final user = await _provider.login(
        username: emailController.text,
        password: passwordController.text,
      );
      isLoading.value = false;
      return user;
    } catch (e) {
      isLoading.value = false;
      return null;
    }
  }
}
