import 'package:flutter/material.dart';

import '../cart_service.dart';
import 'cart_screen.dart';
import 'product_details_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static const List<Map<String, String>> products = [
    {
      'name': 'Nike Shoes',
      'category': 'Men Shoes',
      'price': '\$50',
      'rating': '4.5',
      'image': 'assets/images/Nike_shoes.jpeg',
      'description':
      'A sleek and stylish pair of black Nike sneakers designed for everyday comfort and effortless style. Featuring a classic all-black design, lightweight construction, and a cushioned sole for a comfortable feel throughout the day. Perfect for casual outfits, workouts, and everyday wear.',
    },
    {
      'name': 'Atheletic Shoes',
      'category': 'Men Shoes',
      'price': '\$40',
      'rating': '3.5',
      'image': 'assets/images/atheletic_shoes.jpeg',
      'description':
      'A stylish and comfortable pair of sports sneakers designed for everyday activities and workouts. Featuring a lightweight design, cushioned sole, and breathable material for lasting comfort and support.',
    },
    {
      'name': 'Canvas HalfBoot',
      'category': 'Men Shoes',
      'price': '\$70',
      'rating': '5.0',
      'image': 'assets/images/canvas_halfboot.jpeg',
      'description':
      'A stylish canvas half-boot featuring a classic and versatile design. Made from durable canvas material with a comfortable sole, it is perfect for casual everyday outfits and adds a trendy touch to any look.',
    },
    {
      'name': 'Red Nike Shoes',
      'category': 'Men Shoes',
      'price': '\$430',
      'rating': '4.5',
      'image': 'assets/images/red_nike.jpeg',
      'description':
      'A sleek and stylish pair of Red Nike sneakers designed for everyday comfort and effortless style. Featuring a classic red design, lightweight construction, and a cushioned sole for a comfortable feel throughout the day. Perfect for casual outfits, workouts, and everyday wear.',
    },
    {
      'name': 'Black Activ Shoes',
      'category': 'Men Shoes',
      'price': '\$49',
      'rating': '4.7',
      'image': 'assets/images/activ_black_shoes.jpeg',
      'description':
      'A sleek and stylish pair of black Activ sneakers designed for everyday comfort and effortless style. Featuring a classic all-black design, lightweight construction, and a cushioned sole for a comfortable feel throughout the day. Perfect for casual outfits, workouts, and everyday wear.',
    },
    {
      'name': 'Adidas Shoes',
      'category': 'Men Shoes',
      'price': '\$49',
      'rating': '4.7',
      'image': 'assets/images/adidas_shoes.jpeg',
      'description':
      'A sleek and stylish pair of Adidas sneakers designed for everyday comfort and effortless style. Featuring a classic all-black design, lightweight construction, and a cushioned sole for a comfortable feel throughout the day. Perfect for casual outfits, workouts, and everyday wear.',
    },
    {
      'name': 'Panda Tshirt',
      'category': 'Clothing',
      'price': '\$30',
      'rating': '4.6',
      'image': 'assets/images/panda_t-shirt.jpeg',
      'description':
      'A cute and casual cotton T-shirt featuring a playful panda graphic. Made from soft, breathable cotton for all-day comfort, with a relaxed and versatile design that is perfect for everyday wear.',
    },
    {
      'name': 'Pink Tshirt',
      'category': 'Clothing',
      'price': '\$35',
      'rating': '4.6',
      'image': 'assets/images/pink_tshirt.jpeg',
      'description':
      'A stylish pink T-shirt made from soft, breathable fabric for all-day comfort. Featuring a simple and versatile design, it is perfect for casual everyday looks.',
    },
    {
      'name': 'Navy Basic',
      'category': 'Clothing',
      'price': '\$33',
      'rating': '4.8',
      'image': 'assets/images/navy_tshirt.jpeg',
      'description':
      'A classic plain Navy T-shirt made from soft, breathable cotton for all-day comfort. Featuring a simple design and versatile color.',
    },
    {
      'name': 'Grey Basic',
      'category': 'Clothing',
      'price': '\$50',
      'rating': '4.5',
      'image': 'assets/images/grey_basic.jpeg',
      'description':
      'A classic plain gray T-shirt made from soft, breathable cotton for all-day comfort. Featuring a simple design and versatile color.',
    },
    {
      'name': 'Grey printed Tshirt',
      'category': 'Clothing',
      'price': '\$50',
      'rating': '4.5',
      'image': 'assets/images/grey28_tshirt.jpeg',
      'description':
      'Printed gray T-shirt made from soft, breathable cotton for all-day comfort. Featuring a simple and versatile design.',
    },
    {
      'name': 'Brooklyn t-shirt',
      'category': 'Clothing',
      'price': '\$40',
      'rating': '4.7',
      'image': 'assets/images/Brooklyn_tshirt.jpeg',
      'description':
      'A casual Brooklyn gray T-shirt featuring a stylish graphic design and a comfortable fit. Made from soft, breathable fabric, it is perfect for everyday wear.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFF3F4F6),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black87,
                size: 18,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),

        title: const Text(
          'Products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        // =========================
        // AppBar Buttons
        // =========================

        actions: [
          // Cart button
          Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFF3F4F6),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black87,
                  size: 18,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
              ),
            ),
          ),

          // Filter button
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              right: 8,
            ),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFF3F4F6),
              child: IconButton(
                icon: const Icon(
                  Icons.tune,
                  color: Colors.black87,
                  size: 18,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        child: GridView.builder(
          itemCount: products.length,

          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,

            // حجم الكارت
            childAspectRatio: 0.72,
          ),

          itemBuilder: (context, index) {
            final product = products[index];

            return GestureDetector(
              // =========================
              // Open Product Details
              // =========================

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      product: product,
                    ),
                  ),
                );
              },

              child: Container(
                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // =========================
                    // Flexible Product Image
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
                                  product['image']!,

                                  // الصورة كاملة بدون قص
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
                          // Favorite Button
                          // =========================

                          Positioned(
                            top: 6,
                            right: 6,

                            child: Container(
                              width: 28,
                              height: 28,

                              decoration:
                              const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),

                              child: const Icon(
                                Icons.favorite_border,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),

                          // =========================
                          // Add To Cart Button
                          // =========================

                          Positioned(
                            bottom: 6,
                            right: 6,

                            child: GestureDetector(
                              onTap: () {
                                CartService.instance
                                    .addProduct(
                                  name: product['name']!,
                                  image: product['image']!,
                                  category:
                                  product['category']!,
                                  price: product['price']!,
                                );

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
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // =========================
                    // Product Name
                    // =========================

                    Text(
                      product['name']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 2),

                    // =========================
                    // Category
                    // =========================

                    Text(
                      product['category']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 11,
                      ),
                    ),

                    const Spacer(),

                    // =========================
                    // Price + Rating
                    // =========================

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          product['price']!,

                          style: const TextStyle(
                            color: Color(0xFF7C3AED),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),

                            const SizedBox(width: 2),

                            Text(
                              product['rating']!,

                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}