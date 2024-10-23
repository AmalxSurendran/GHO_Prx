import 'dart:async';
import 'package:flutter/material.dart';

import 'splash3.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.of(context).pushAndRemoveUntil(
          MyCustomRouteTransition(
            route: const Splash3(),
          ),
          (route) => false,
        );

        Timer(const Duration(milliseconds: 500), () {
          controller.reset();
        });
      }
    });

    scaleAnimation = Tween<double>(begin: 1, end: 10).animate(controller);

    // Automatically start the scale animation when the splash screen is displayed
    Timer(const Duration(seconds: 1), () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff244C81),
      body: Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 5, end: 1500),
            duration: const Duration(seconds: 4),
            builder: (context, size, widget) {
              return Transform.rotate(
                angle: 150 * (3.14159 / 180), // Convert degrees to radians
                child: Container(
                  height: size * 60,
                  width: size,
                  decoration: const BoxDecoration(
                    color: Color(0xFFBFDBFE),
                    shape: BoxShape.rectangle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyCustomRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransition({required this.route})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return route;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            );
            return SlideTransition(
              position: tween,
              child: child,
            );
          },
        );
}
