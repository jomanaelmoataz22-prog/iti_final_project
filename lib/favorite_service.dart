import 'package:flutter/foundation.dart';

class FavoriteItem {
  final String name;
  final String image;
  final String category;
  final String price;

  FavoriteItem({
    required this.name,
    required this.image,
    required this.category,
    required this.price,
  });
}

class FavoritesService extends ChangeNotifier {
  FavoritesService._();

  static final FavoritesService instance = FavoritesService._();

  final List<FavoriteItem> _items = [];

  List<FavoriteItem> get items => List.unmodifiable(_items);

  bool isFavorite(String name) {
    return _items.any(
          (item) => item.name == name,
    );
  }

  void toggleFavorite({
    required String name,
    required String image,
    required String category,
    required String price,
  }) {
    final index = _items.indexWhere(
          (item) => item.name == name,
    );

    if (index != -1) {
      _items.removeAt(index);
    } else {
      _items.add(
        FavoriteItem(
          name: name,
          image: image,
          category: category,
          price: price,
        ),
      );
    }

    notifyListeners();
  }

  void removeFavorite(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}