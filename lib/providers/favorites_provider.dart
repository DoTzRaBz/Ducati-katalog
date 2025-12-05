import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  List<int> get favoriteProductIds =>
      _favoriteProducts.map((p) => p.id).toList();

  bool isFavorite(String productId) {
    return _favoriteProducts.any((p) => p.id.toString() == productId);
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product.id.toString())) {
      _favoriteProducts.removeWhere((p) => p.id == product.id);
    } else {
      _favoriteProducts.add(product);
    }
    notifyListeners();
  }
}
