import 'package:flutter/material.dart';

import '../cart_service.dart';

class CustomSearch extends SearchDelegate<String?> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Adidas Shoes',
      'image': 'assets/images/adidas_shoes.jpeg',
      'price': 49,
      'category': 'Men Shoes',
    },
    {
      'name': 'Athletic Shoes',
      'image': 'assets/images/atheletic_shoes.jpeg',
      'price': 40,
      'category': 'Men Shoes',
    },
    {
      'name': 'Black Activ Shoes',
      'image': 'assets/images/activ_black_shoes.jpeg',
      'price': 49,
      'category': 'Men Shoes',
    },
    {
      'name': 'Canvas Shoes Boot',
      'image': 'assets/images/canvas_halfboot.jpeg',
      'price': 70,
      'category': 'Men Shoes',
    },
    {
      'name': 'Red Nike Shoes',
      'image': 'assets/images/red_nike.jpeg',
      'price': 30,
      'category': 'Men Shoes',
    },
    {
      'name': 'Nike Shoes',
      'image': 'assets/images/Nike_shoes.jpeg',
      'price': 50,
      'category': 'Men Shoes',
    },
    {
      'name': 'Panda T-shirt',
      'image': 'assets/images/panda_t-shirt.jpeg',
      'price': 30,
      'category': 'Clothing',
    },
    {
      'name': 'Navy T-shirt',
      'image': 'assets/images/navy_tshirt.jpeg',
      'price': 50,
      'category': 'Clothing',
    },
    {
      'name': 'Printed Grey T-shirt',
      'image': 'assets/images/grey28_tshirt.jpeg',
      'price': 50,
      'category': 'Clothing',
    },
    {
      'name': 'Pink T-shirt',
      'image': 'assets/images/pink_tshirt.jpeg',
      'price': 35,
      'category': 'Clothing',
    },
    {
      'name': 'Grey Basic',
      'image': 'assets/images/grey_basic.jpeg',
      'price': 50,
      'category': 'Clothing',
    },
    {
      'name': 'Brooklyn T-shirt',
      'image': 'assets/images/Brooklyn_tshirt.jpeg',
      'price': 40,
      'category': 'Clothing',
    },
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  List<Map<String, dynamic>> get filteredProducts {
    if (query.trim().isEmpty) {
      return products;
    }

    final searchQuery = query.toLowerCase().trim();

    return products.where((product) {
      final name =
      product['name'].toString().toLowerCase();

      final category =
      product['category'].toString().toLowerCase();

      return name.contains(searchQuery) ||
          category.contains(searchQuery);
    }).toList();
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildProductGrid(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildProductGrid(context);
  }

  Widget buildProductGrid(BuildContext context) {
    final results = filteredProducts;

    if (results.isEmpty) {
      return const Center(
        child: Text(
          'No products found',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),

      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,

        // حجم الكارت مرن
        childAspectRatio: 0.72,
      ),

      itemCount: results.length,

      itemBuilder: (context, index) {
        final product = results[index];

        return Container(
          padding: const EdgeInsets.all(8),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // =========================
              // FLEXIBLE IMAGE
              // =========================

              Expanded(
                flex: 6,

                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(12),

                        child: Container(
                          width: double.infinity,

                          color: Colors.grey.shade50,

                          padding:
                          const EdgeInsets.all(6),

                          child: Image.asset(
                            product['image'].toString(),

                            // الصورة تظهر كاملة بدون قص
                            fit: BoxFit.contain,

                            alignment: Alignment.center,

                            errorBuilder:
                                (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,

                                child: const Center(
                                  child: Icon(
                                    Icons
                                        .image_not_supported,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // =========================
                    // ADD TO CART BUTTON
                    // =========================

                    Positioned(
                      right: 6,
                      bottom: 6,

                      child: GestureDetector(
                        onTap: () {
                          // إضافة المنتج إلى الـ Cart
                          CartService.instance.addProduct(
                            name: product['name']
                                .toString(),

                            image: product['image']
                                .toString(),

                            category: product['category']
                                .toString(),

                            price:
                            '\$${product['price']}',
                          );

                          // رسالة للمستخدم
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                '${product['name']} added to cart',
                              ),

                              duration:
                              const Duration(
                                seconds: 1,
                              ),
                            ),
                          );
                        },

                        child: Container(
                          width: 30,
                          height: 30,

                          decoration:
                          const BoxDecoration(
                            color: Color(0xFF7C3AED),
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // =========================
              // PRODUCT NAME
              // =========================

              Text(
                product['name'].toString(),

                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 3),

              // =========================
              // CATEGORY
              // =========================

              Text(
                product['category'].toString(),

                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                ),
              ),

              const Spacer(),

              // =========================
              // PRICE
              // =========================

              Text(
                '\$${product['price']}',

                style: const TextStyle(
                  color: Color(0xFF7C3AED),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}