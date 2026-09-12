import 'package:flutter/material.dart';

import 'package:iti_final_project/favorite_service.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();

    FavoritesService.instance.addListener(
      _onFavoritesChanged,
    );
  }

  @override
  void dispose() {
    FavoritesService.instance.removeListener(
      _onFavoritesChanged,
    );

    super.dispose();
  }

  void _onFavoritesChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesService.instance.items;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: favorites.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80,
              color: Colors.grey,
            ),

            SizedBox(height: 15),

            Text(
              'No favorites yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 8),

            Text(
              'Add products to your favorites',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(15),

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.70,
        ),

        itemCount: favorites.length,

        itemBuilder: (context, index) {
          final item = favorites[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),

              boxShadow: [
                BoxShadow(
                  color:
                  Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),

                          child: Padding(
                            padding:
                            const EdgeInsets.all(8),

                            child: Image.asset(
                              item.image,

                              fit: BoxFit.contain,

                              errorBuilder:
                                  (context, error, stackTrace) {
                                return Container(
                                  color:
                                  Colors.grey.shade100,

                                  child: const Center(
                                    child: Icon(
                                      Icons
                                          .image_not_supported,
                                      color: Colors.grey,
                                      size: 50,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 5,
                        right: 5,

                        child: IconButton(
                          onPressed: () {
                            FavoritesService.instance
                                .removeFavorite(index);
                          },

                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 5,
                    top: 5,
                  ),

                  child: Text(
                    item.name,

                    maxLines: 1,

                    overflow:
                    TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 3,
                    bottom: 10,
                  ),

                  child: Text(
                    item.price,

                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6055D8),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}