import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/view/splash_view/splash2.dart';

import 'splash2.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds before navigating to Splash2
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const Splash2()); // Navigate after the delay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Image.asset('assets/splash_images/Spalsh screen (1).png',fit: BoxFit.cover,)),),
    );
  }
}