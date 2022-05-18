import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/startup_controller.dart';

class StartupView extends GetView<StartupController> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.emoji_food_beverage,
          size: 200,
        ),
      ),
    );
  }
}
