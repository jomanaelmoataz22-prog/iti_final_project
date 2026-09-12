import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dartgit init';
import '../widgets/profile_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  final List<String> names = const [
    "Profile",
    "Setting",
    "Contact",
    "Share App",
    "Help",
  ];

  final List<IconData> icons = const [
    Icons.person,
    Icons.settings,
    Icons.email,
    Icons.share,
    Icons.help,
  ];

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
          (route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final String userName =
        user?.email?.split('@').first ?? "User";

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFE0E0E0),

            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            userName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xD9000000),
            ),
          ),

          const SizedBox(height: 24),

          Expanded(
            child: ListView.builder(
              itemCount: names.length,

              itemBuilder: (context, index) {
                return ProfileWidget(
                  p1name: names[index],
                  p1icon: icons[index],
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              bottom: 40,
            ),

            child: TextButton(
              onPressed: () async {
                await signOut(context);
              },

              child: const Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffF55F1F),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}