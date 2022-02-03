import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class CartItem {
  final String productId;
  final String title;
  final double price;
  final int quantity;
  CartItem({
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(
    String productId,
    String title,
    double price,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          productId: existingItem.productId,
          title: existingItem.title,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          productId: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}