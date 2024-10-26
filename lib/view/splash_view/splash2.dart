import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            Positioned(
              top: -106,
              left: -12,
              child: Container(
                height: 352,
                width: 352,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      const Color(0xffC72FF8),
                      const Color(0xffC72FF8).withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -56,
              left: -43,
              child: Container(
                height: 352,
                width: 352,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      const Color(0xff2F56F8),
                      const Color(0xffC630F8).withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -84,
              left: -74,
              child: Container(
                height: 352,
                width: 352,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color(0xff3AF9EF),
                      Color(0xff5264F9),
                    ],
                  ),
                ),
              ),
            ),
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
                  color: const Color(0xff0D2E41),
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
                  color: const Color(0xff0D2E41).withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: 638,
              left: 40,
              right: 40,
              child: Row(
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
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
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
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  Column(
//                 children: [
//                   
//                   ),
//                   const SizedBox(height: 10),
//                   
//                   ),
//                   const SizedBox(height: 20),
//                   
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'By signing up, you agree to our ',
//                         style: TextStyle(
//                           fontSize: 8,
//                           fontWeight: FontWeight.w400,
//                           color: const Color(0xff0D2E41).withOpacity(0.5),
//                         ),
//                       ),
//                       const Text(
//                         'Terms and Conditions',
//                         style: TextStyle(
//                           fontSize: 8,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xff027DFF),
//                         ),
//                       ),
//                       Text(
//                         ' & ',
//                         style: TextStyle(
//                           fontSize: 8,
//                           fontWeight: FontWeight.w400,
//                           color: const Color(0xff0D2E41).withOpacity(0.5),
//                         ),
//                       ),
//                       const Text(
//                         'Privacy Policy.',
//                         style: TextStyle(
//                           fontSize: 8,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xff027DFF),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),