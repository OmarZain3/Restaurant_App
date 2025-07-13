import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

final basketProvider = StateNotifierProvider<BasketNotifier, List<Product>>((ref) => BasketNotifier());

class BasketNotifier extends StateNotifier<List<Product>> {
  BasketNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }
}
