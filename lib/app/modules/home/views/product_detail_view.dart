import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductDetailView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
