import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Splash3 extends StatelessWidget {
  const Splash3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                alignment: Alignment.topCenter,

                'assets/splash_images/Spalsh screen.png',
                fit: BoxFit
                    .cover, // Ensures the image fills the screen while maintaining aspect ratio
              ),
            ),
            Positioned(
              top: 280,
              left: 20,
              right: 20,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 105,
                      width: 105,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.blue7)),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              border: Border.all(color: AppColors.blue7)),
                          child: Center(
                              child: Image.asset(
                            'assets/splash_images/Ellipse 3014-1.png',
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Your Health,\nOne Tap Away',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff0D2E41),
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Connect with Specialized Doctors for your time & \n Comprehensive Medical Consultations.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff0D2E41).withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed('/RegisterPage'),
                          child: Container(
                            height: 37,
                            width: 147,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xff027DFF)),
                                borderRadius: BorderRadius.circular(4)),
                            child: const Center(
                                child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Color(0xff027DFF)),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/LoginPage'),
                          child: Container(
                            height: 37,
                            width: 147,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: const LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Color(0xff155274),
                                  Color(0xff027DFF),
                                ],
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: AppColors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By signing up, you agree to our ',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0D2E41).withOpacity(0.5)),
                        ),
                        const Text(
                          'Terms and Conditions',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff027DFF)),
                        ),
                        Text(
                          '& ',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0D2E41).withOpacity(0.5)),
                        ),
                        const Text(
                          'Privacy Policy.',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff027DFF)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
