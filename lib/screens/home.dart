import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'search_screen.dart';
import '../widgets/home_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String userName;

  final List<String> names = [
    "Nike Shoes",
    "Atheletic Shoes",
    "Canvas HalfBoot",
    "Red Nike Shoes",
    "Black Activ Shoes",
    "Adidas Shoes",
  ];

  final List<double> prices = [
    50,
    40,
    70,
    30,
    49,
    49,
  ];

  final List<String> images = [
    "assets/images/Nike_shoes.jpeg",
    "assets/images/atheletic_shoes.jpeg",
    "assets/images/canvas_halfboot.jpeg",
    "assets/images/red_nike.jpeg",
    "assets/images/activ_black_shoes.jpeg",
    "assets/images/adidas_shoes.jpeg",
  ];

  final List<String> namess = [
    "Panda Tshirt",
    "Pink Tshirt",
    "Navy Basic",
    "Grey Basic",
    "Grey printed Tshirt",
    "Brooklyn t-shirt",
  ];

  final List<double> pricess = [
    30,
    35,
    33,
    50,
    50,
    40,
  ];

  final List<String> imagess = [
    "assets/images/panda_t-shirt.jpeg",
    "assets/images/pink_tshirt.jpeg",
    "assets/images/navy_tshirt.jpeg",
    "assets/images/grey_basic.jpeg",
    "assets/images/grey28_tshirt.jpeg",
    "assets/images/Brooklyn_tshirt.jpeg",
  ];

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;

    // لو عندك displayName استخدمه
    // ولو مش موجود استخدم الجزء اللي قبل @ في الإيميل
    userName = user?.displayName ??
        user?.email?.split('@').first ??
        "User";
  }

  void _openSearch() {
    showSearch(
      context: context,
      delegate: CustomSearch(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xFF6C4DFF),
                          backgroundImage: AssetImage(
                            "assets/images/Ellipse 1.png",
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hello!",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),

                              Text(
                                userName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none_rounded,
                            size: 28,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _openSearch,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[100],
                          foregroundColor: Colors.grey,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Search here",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6C4DFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Get Winter Discount",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "20% Off",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "For Children",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            right: 10,
                            bottom: 0,
                            child: Image.asset(
                              "assets/images/child.png",
                              height: 140,
                              errorBuilder:
                                  (context, error, stackTrace) {
                                return const SizedBox();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Featured",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const ProductScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6055D8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return HomeWidgets(
                      image: images[index],
                      name: names[index],
                      price: prices[index],
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Most Popular",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const ProductScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6055D8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  itemCount: namess.length,
                  itemBuilder: (context, index) {
                    return HomeWidgets(
                      image: imagess[index],
                      name: namess[index],
                      price: pricess[index],
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
