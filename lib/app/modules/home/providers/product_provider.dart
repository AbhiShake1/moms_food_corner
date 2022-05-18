import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../product_model.dart';

class ProductsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Product.fromJson(map);
      if (map is List) {
        return map.map((item) => Product.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Product?>> getAllProducts() async {
    final jsonString = await rootBundle.loadString('assets/products.json');
    final json = jsonDecode(jsonString) as List;
    final result = json.map((e) => Product.fromJson(e)).toList();
    return result;
  }

  Future<Product?> getProduct(int id) async {
    final response = await get('products/$id');
    return response.body;
  }

  Future<Response<Product>> postProduct(Product products) async =>
      await post('products', products);
  Future<Response> deleteProducts(int id) async => await delete('products/$id');
}
