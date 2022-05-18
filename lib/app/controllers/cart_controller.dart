import 'package:get/get.dart';
import 'package:moms_food_corner/app/modules/home/product_model.dart';

import '../modules/home/providers/product_provider.dart';

class CartController extends GetxController with StateMixin<List<Product?>> {
  final _provider = ProductsProvider();

  final _products = <Product?>[].obs;

  @override
  void onInit() {
    _provider
        .getAllProducts()
        .then((e) => change(e, status: RxStatus.success()));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  int get total => _products.length;

  List<Product?> get products => _products;
  List<Product?> get uniqueProducts => {..._products}.toList();

  int get totalPrice => _products.fold<int>(
      0, (previousValue, element) => previousValue + (element?.price ?? 0));

  int getProductCount(Product product) =>
      _products.where((p) => identical(p, product)).length;

  void addToCart(Product product) => _products.add(product);
  void removeFromCart(Product product) {
    final index =
        _products.indexWhere((element) => identical(element, product));
    if (index != -1) _products.removeAt(index);
  }
}
