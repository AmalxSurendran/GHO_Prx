import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/controller/auth_controller/splashController.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SplashController (will automatically call checkLoginStatus)
    Get.put(SplashController());

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
