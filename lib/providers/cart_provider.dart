
import 'package:flutter/foundation.dart';

import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Map<int, Product> _items = {};

  Map<int, Product> get items => _items;

  int get itemCount => _items.length;

  void addToCart(Product product, int quantity) {
    if (_items.containsKey(product.id)) {
      // Change quantity
    } else {
      _items.putIfAbsent(product.id, () => product);
    }
    notifyListeners();
  }

  void removeFromCart(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
