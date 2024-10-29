import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed('/splash'); // Navigate after the delay
    });
    return Scaffold(
      body: Center(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Image.asset(
              'assets/splash_images/Spalsh screen (1).png',
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
