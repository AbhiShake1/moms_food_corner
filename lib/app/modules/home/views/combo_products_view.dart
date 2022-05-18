import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ComboProductsView extends GetView {
  const ComboProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComboProductsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ComboProductsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
