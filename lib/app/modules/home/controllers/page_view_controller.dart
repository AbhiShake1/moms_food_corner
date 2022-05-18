import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  late final PageController controller;
  final _isFirstActive = true.obs;
  final _isSecondActive = false.obs;
  @override
  void onInit() {
    controller = PageController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void toPage(int page) {
    controller.jumpToPage(page);
    _isFirstActive.value = page == 0;
    _isSecondActive.value = page == 1;
  }

  bool get isFirstActive => _isFirstActive.value;
  bool get isSecondActive => _isSecondActive.value;
}
