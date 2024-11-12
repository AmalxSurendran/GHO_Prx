import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash1 extends StatefulWidget {
  Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  String? token;

  @override
  void initState() {
    super.initState();
    // Fetch the token and check the login status after a delay
    Future.delayed(const Duration(seconds: 3), () async {
      // await getdata();  // Ensure data is fetched before checking login status
      checkLoginStatus();  // Now check login status
    });
  }

  // Method to fetch data from SharedPreferences
  getdata() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    token = _pref.getString('token');
  }

  // Method to check login status and navigate
  Future<void> checkLoginStatus() async {
    if (token == null) {
      // Navigate to the login page if no token found
      Get.toNamed('/LoginPage');
    } else {
      // Navigate to homepage if token is present
      Get.toNamed('/homepage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Image.asset(
            'assets/splash_images/Spalsh screen (1).png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
