import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/products_screen.dart';
import 'screens/favorite_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile.dart';
import 'screens/search_screen.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  // ده رقم الزر اللي منوّر في الـ BottomNavigationBar
  int selectedNavIndex = 0;

  // ده رقم الشاشة اللي بتظهر في الـ IndexedStack
  int screenIndex = 0;

  final List<Widget> screens = [
    Home(),
    const ProductScreen(),
    const FavoritesScreen(),
    const CartScreen(),
     Profile(),
  ];

  void openSearch() {
    showSearch(
      context: context,
      delegate: CustomSearch(),
    );
  }

  void changePage(int value) {
    // Search
    if (value == 1) {
      openSearch();
      return;
    }

    setState(() {
      selectedNavIndex = value;

      if (value == 0) {
        // Home
        screenIndex = 0;
      } else if (value == 2) {
        // Products
        screenIndex = 1;
      } else if (value == 3) {
        // Favorites
        screenIndex = 2;
      } else if (value == 4) {
        // Cart
        screenIndex = 3;
      } else if (value == 5) {
        // Profile
        screenIndex = 4;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: screenIndex,
        children: screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        // مهم جداً:
        // هنا بنستخدم رقم زر الـNavigation
        currentIndex: selectedNavIndex,

        onTap: changePage,

        type: BottomNavigationBarType.fixed,

        selectedItemColor: const Color(0xffFF5E00),
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}