import 'package:flutter/material.dart';

import '../cart_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartService cart = CartService.instance;

  @override
  void initState() {
    super.initState();

    cart.addListener(_cartUpdated);
  }

  @override
  void dispose() {
    cart.removeListener(_cartUpdated);
    super.dispose();
  }

  void _cartUpdated() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: cart.items.isEmpty
          ? const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 70,
              color: Colors.grey,
            ),

            SizedBox(height: 12),

            Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6),

            Text(
              'Add some products to your cart',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
          : SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: _buildCartItem(
                      item: item,
                      index: index,
                    ),
                  );
                },
              ),
            ),

            _buildSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required CartItem item,
    required int index,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          // =====================
          // Product Image
          // =====================

          ClipRRect(
            borderRadius: BorderRadius.circular(12),

            child: Container(
              width: 80,
              height: 80,
              color: Colors.white,

              padding: const EdgeInsets.all(5),

              child: Image.asset(
                item.image,
                fit: BoxFit.contain,

                errorBuilder: (
                    context,
                    error,
                    stackTrace,
                    ) {
                  return const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 12),

          // =====================
          // Product Information
          // =====================

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  item.category,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  item.price,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 8),

                // Quantity
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cart.decreaseQuantity(index);
                        },

                        child: const Icon(
                          Icons.remove,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),

                        child: Text(
                          '${item.quantity}',

                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          cart.increaseQuantity(index);
                        },

                        child: const Icon(
                          Icons.add,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // =====================
          // Delete
          // =====================

          IconButton(
            onPressed: () {
              cart.removeItem(index);
            },

            icon: const Icon(
              Icons.delete_outline,
              color: Colors.redAccent,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSummaryRow(
            title: 'Sub-total',
            amount: '\$${cart.subtotal.toStringAsFixed(2)}',
          ),

          const SizedBox(height: 10),

          _buildSummaryRow(
            title: 'VAT (%)',
            amount: '\$${cart.vat.toStringAsFixed(2)}',
          ),

          const SizedBox(height: 10),

          _buildSummaryRow(
            title: 'Shipping fee',
            amount: '\$${cart.shippingFee.toStringAsFixed(2)}',
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xFFEEEEEE),
            ),
          ),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                '\$${cart.total.toStringAsFixed(2)}',

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 52,

            child: ElevatedButton(
              onPressed: () {
                // هنضيف صفحة Checkout هنا بعدين
              },

              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xFF4361EE),

                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),
              ),

              child: const Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text(
                    'Go To Checkout',

                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: 8),

                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow({
    required String title,
    required String amount,
  }) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,

          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),

        Text(
          amount,

          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}