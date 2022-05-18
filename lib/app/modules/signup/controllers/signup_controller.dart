import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moms_food_corner/app/routes/app_pages.dart';

import '../../../data/models/user_model.dart';
import '../../../data/providers/user_provider.dart';

class SignupController extends GetxController {
  final _provider = UserProvider();

  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  late final TextEditingController emailController,
      passwordController,
      firstNameController,
      lastNameController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
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
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }

  Future<User?> signup() async {
    try {
      isLoading.value = true;
      final user = await _provider.signUp(
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
