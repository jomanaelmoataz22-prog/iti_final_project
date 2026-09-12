import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  final String image;
  final String name;
  final int price;

  const HomeWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 175,

      margin: const EdgeInsets.all(8),

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
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),

                child: Image.asset(
                  widget.image,
                  width: 155,
                  height: 120,
                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {
                    return Container(
                      width: 155,
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
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },

                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,

                    color: isFavorite
                        ? Colors.red
                        : Colors.white,

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
                fontSize: 14,
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
              '\$${widget.price}',

              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xff6055D8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}