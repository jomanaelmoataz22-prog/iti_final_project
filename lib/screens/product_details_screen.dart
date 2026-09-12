import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, String> product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends State<ProductDetailsScreen> {
  String selectedSize = '40';

  final List<String> shoeSizes = [
    '38',
    '39',
    '40',
    '41',
    '42',
  ];

  final List<String> clothingSizes = [
    'S',
    'M',
    'L',
    'XL',
  ];

  List<String> get availableSizes {
    final category =
        widget.product['category']?.toLowerCase() ?? '';

    if (category.contains('clothing')) {
      return clothingSizes;
    }

    return shoeSizes;
  }

  @override
  void initState() {
    super.initState();

    final category =
        widget.product['category']?.toLowerCase() ?? '';

    if (category.contains('clothing')) {
      selectedSize = 'M';
    } else {
      selectedSize = '40';
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.product['name'] ?? 'Product';
    final image = widget.product['image'] ?? '';
    final category =
        widget.product['category'] ?? 'Product';
    final rating =
        widget.product['rating'] ?? '0.0';
    final price =
        widget.product['price'] ?? '\$0';
    final description =
        widget.product['description'] ??
            'No description available.';

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 280,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,

                            borderRadius:
                            const BorderRadius.vertical(
                              bottom: Radius.circular(24),
                            ),

                            image: image.isNotEmpty
                                ? DecorationImage(
                              image:
                              AssetImage(image),
                              fit: BoxFit.cover,
                            )
                                : null,
                          ),
                        ),

                        Positioned(
                          top: 16,
                          left: 16,

                          child: CircleAvatar(
                            backgroundColor: Colors.white,

                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black87,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),

                        Positioned(
                          top: 16,
                          right: 16,

                          child: CircleAvatar(
                            backgroundColor: Colors.white,

                            child: IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.black87,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: [
                              Text(
                                category,
                                style: TextStyle(
                                  color:
                                  Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),

                              const Spacer(),

                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),

                              const SizedBox(width: 4),

                              Text(
                                rating,
                                style: const TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Size Option',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children:
                            availableSizes.map((size) {
                              final isSelected =
                                  selectedSize == size;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },

                                child: Container(
                                  margin:
                                  const EdgeInsets.only(
                                    right: 12,
                                  ),

                                  width: 42,
                                  height: 42,

                                  decoration:
                                  BoxDecoration(
                                    color: isSelected
                                        ? const Color(
                                        0xFF7C3AED)
                                        : Colors.grey
                                        .shade100,

                                    borderRadius:
                                    BorderRadius
                                        .circular(12),
                                  ),

                                  alignment:
                                  Alignment.center,

                                  child: Text(
                                    size,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black87,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            description,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),

              decoration: BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color:
                    Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),

              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),

                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7C3AED),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 24),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              'تم شراء $name مقاس $selectedSize',
                            ),
                          ),
                        );
                      },

                      style:
                      ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xFF7C3AED),

                        padding:
                        const EdgeInsets.symmetric(
                          vertical: 14,
                        ),

                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(14),
                        ),
                      ),

                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}