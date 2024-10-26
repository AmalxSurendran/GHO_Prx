import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(child: Image.asset('assets/splash_images/Shapes.png')),
          Positioned(
            top: 50,
            left: 49,
            child: Image.asset(
              'assets/splash_images/Ellipse 3014-1.png',
              height: 48,
              width: 49,
            ),
          ),
          Positioned(
            top: 121,
            left: 44,
            child: Text(
              'Welcome to \nGHOPRx',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
          Positioned(
            top: 489,
            left: 113,
            child: Text(
              'Your Health,\nOne Tap Away',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black1,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 573,
            left: 33,
            child: Text(
              'Connect with Specialized Doctors for your time & \nComprehensive Medical Consultations.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black1.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 638,
            left: 32,
            right: 32,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle sign-up navigation
                    Get.toNamed('/RegisterPage');
                  },
                  child: Container(
                    height: 40,
                    width: 155,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff027DFF)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xff027DFF),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // Handle login navigation
                    Get.toNamed('/LoginPage');
                  },
                  child: Container(
                    height: 40,
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                     color: AppColors.blue
                    ),
                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 72,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By signing up, you agree to our ',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff0D2E41).withOpacity(0.5),
                  ),
                ),
                const Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff027DFF),
                  ),
                ),
                Text(
                  ' & ',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff0D2E41).withOpacity(0.5),
                  ),
                ),
                const Text(
                  'Privacy Policy.',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff027DFF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
