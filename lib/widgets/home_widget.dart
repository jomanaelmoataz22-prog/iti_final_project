import 'package:flutter/material.dart';

import 'package:iti_final_project/favorite_service.dart';

class HomeWidgets extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final VoidCallback? onTap;

  const HomeWidgets({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.onTap,
  });

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  @override
  void initState() {
    super.initState();

    FavoritesService.instance.addListener(_onFavoritesChanged);
  }

  @override
  void dispose() {
    FavoritesService.instance.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  void _onFavoritesChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleFavorite() {
    FavoritesService.instance.toggleFavorite(
      name: widget.name,
      image: widget.image,
      category: 'Products',
      price: '\$${widget.price.toStringAsFixed(0)}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isFavorite =
    FavoritesService.instance.isFavorite(widget.name);

    return GestureDetector(
      onTap: widget.onTap,

      child: Container(
        width: 155,
        height: 175,
        margin: const EdgeInsets.all(8),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),

                  child: Image.asset(
                    widget.image,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.contain,

                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,

                  child: IconButton(
                    onPressed: _toggleFavorite,

                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,

                      color: isFavorite
                          ? Colors.red
                          : Colors.grey,

                      size: 30,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 7,
                right: 5,
              ),

              child: Text(
                widget.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 2,
              ),

              child: Text(
                '\$${widget.price.toStringAsFixed(0)}',

                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6055D8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}