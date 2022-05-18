import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  controller: controller.emailController,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Password'),
                  controller: controller.passwordController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final user = await controller.login();
                    if (user == null) {
                      Get.snackbar(
                        'Invalid Credentials',
                        'Username and password does not match',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      Get.offAndToNamed(Routes.HOME);
                    }
                  },
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Text('Don\'t have an account yet?'),
              TextButton(
                onPressed: () => Get.offAndToNamed(Routes.SIGNUP),
                child: const Text('Signup'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
