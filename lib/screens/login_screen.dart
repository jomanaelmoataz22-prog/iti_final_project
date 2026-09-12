import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signup_screen.dart';
import '../nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool obscurePassword = true;
  bool isLoading = false;

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('من فضلك املي كل الحقول'),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم تسجيل الدخول بنجاح!'),
        ),
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Nav(),
        ),
            (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ?? 'بيانات الدخول غير صحيحة',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
              const SizedBox(height: 20),

              // =========================
              // Background Image
              // =========================
              SizedBox(
                width: double.infinity,

                child: AspectRatio(
                  aspectRatio: 16 / 9,

                  child: Image.asset(
                    'assets/images/Background.jpeg',

                    width: double.infinity,
                    height: double.infinity,

                    // الصورة تظهر كاملة بدون قص
                    fit: BoxFit.contain,

                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        color: Colors.grey.shade100,
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // =========================
              // Login Content
              // =========================
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),

                    const Text(
                      'Enter your email',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller: emailController,
                      keyboardType:
                      TextInputType.emailAddress,

                      decoration: InputDecoration(
                        hintText: 'user@gmail.com',

                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller: passwordController,
                      obscureText: obscurePassword,

                      decoration: InputDecoration(
                        hintText: 'Enter your password',

                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons
                                .visibility_off_outlined
                                : Icons
                                .visibility_outlined,
                            color: Colors.grey,
                          ),

                          onPressed: () {
                            setState(() {
                              obscurePassword =
                              !obscurePassword;
                            });
                          },
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // =========================
                    // Remember Me
                    // =========================
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,

                              activeColor:
                              const Color(0xFF5E48E8),

                              onChanged: (value) {
                                setState(() {
                                  rememberMe =
                                      value ?? false;
                                });
                              },
                            ),

                            const Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        TextButton(
                          onPressed: () {},

                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // =========================
                    // Login Button
                    // =========================
                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xFF5E48E8),

                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        ),

                        onPressed: isLoading
                            ? null
                            : loginUser,

                        child: isLoading
                            ? const SizedBox(
                          width: 22,
                          height: 22,

                          child:
                          CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            : const Text(
                          'Login',

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // =========================
                    // Sign Up
                    // =========================
                    Center(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [
                          const Text(
                            "Don't have an account? ",

                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (context) =>
                                  const SignUpScreen(),
                                ),
                              );
                            },

                            child: const Text(
                              'Sign up',

                              style: TextStyle(
                                color: Colors.black,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}