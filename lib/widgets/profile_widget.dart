import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.p1name,
    required this.p1icon,
  });

  final String p1name;
  final IconData p1icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children: [
              Icon(
                p1icon,
                color: const Color(0xD9000000),
                size: 22,
              ),

              const SizedBox(width: 14),

              Text(
                p1name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xD9000000),
                ),
              ),
            ],
          ),

          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xD9000000),
            size: 16,
          ),
        ],
      ),
    );
  }
}