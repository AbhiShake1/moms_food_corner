import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (e) {
                      if (e == null) return 'Email cannot be empty';
                      if (!e.isEmail) return 'Invalid Email';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: const InputDecoration(hintText: 'Password'),
                    validator: (e) {
                      if (e == null) return 'Password cannot be empty';
                      if (e.length < 6) {
                        return 'Password must be at least 6 character long.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.firstNameController,
                    decoration: const InputDecoration(hintText: 'First Name'),
                    validator: (e) {
                      if (e?.isEmpty ?? true) {
                        return 'First Name cannot be empty';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.lastNameController,
                    decoration: const InputDecoration(hintText: 'Last Name'),
                    validator: (e) {
                      if (e?.isEmpty ?? true) {
                        return 'Last Name cannot be empty';
                      }
                      return null;
                    },
                  ),
                ],
              )),
          ElevatedButton(
            onPressed: () async {
              if (!controller.formKey.currentState!.validate()) return;
              final user = await controller.signup();
              if (user == null) {
                Get.snackbar(
                  'Authentication Error',
                  'This user already exists',
                  snackPosition: SnackPosition.BOTTOM,
                );
              } else {
                Get.offAndToNamed(Routes.HOME);
              }
            },
            child: Obx(
              () => controller.isLoading.isTrue
                  ? const CircularProgressIndicator()
                  : const Text('Signup'),
            ),
          ),
          Row(
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () => Get.offAndToNamed(Routes.LOGIN),
                child: const Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
