import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ComboProductsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComboProductsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ComboProductsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
