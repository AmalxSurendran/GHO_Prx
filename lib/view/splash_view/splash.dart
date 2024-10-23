import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/view/splash_view/splash3.dart';

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
      Get.off(() => const Splash3()); // Navigate after the delay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff244C81),
      body: Center(child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.asset('assets/splash_images/Ellipse 3014.png',fit: BoxFit.cover,)),),
    );
  }
}