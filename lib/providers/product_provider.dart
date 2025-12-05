import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = Product.products;

  List<Product> get allProducts => _products;

  List<Product> get highlightedProducts => _products.where((p) => p.id <= 2).toList();

  List<Product> get featuredProducts => _products.where((p) => p.id > 2 && p.id <= 4).toList();

  List<Product> get newArrivals => _products.where((p) => p.id > 4).toList();

  Product findById(String id) {
    return _products.firstWhere((p) => p.id.toString() == id);
  }
}
