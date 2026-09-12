import 'package:flutter/foundation.dart';

class CartItem {
  final String name;
  final String image;
  final String category;
  final String price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    this.quantity = 1,
  });
}

class CartService extends ChangeNotifier {
  CartService._();

  static final CartService instance = CartService._();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addProduct({
    required String name,
    required String image,
    required String category,
    required String price,
  }) {
    final existingIndex = _items.indexWhere(
          (item) => item.name == name,
    );

    if (existingIndex != -1) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(
        CartItem(
          name: name,
          image: image,
          category: category,
          price: price,
        ),
      );
    }

    notifyListeners();
  }

  void increaseQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
    }

    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double get subtotal {
    double total = 0;

    for (final item in _items) {
      final price = double.tryParse(
        item.price.replaceAll('\$', '').replaceAll(',', '').trim(),
      ) ??
          0;

      total += price * item.quantity;
    }

    return total;
  }

  double get shippingFee {
    return _items.isEmpty ? 0 : 80;
  }

  double get vat {
    return 0;
  }

  double get total {
    return subtotal + vat + shippingFee;
  }
}