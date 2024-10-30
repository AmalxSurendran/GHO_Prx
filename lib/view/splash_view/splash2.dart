import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        return Scaffold(
          backgroundColor: AppColors.white,
          body: Stack(
            children: [
              Positioned(
                top: -height * 0.78,
                left: -width * 0.65,
                child: Container(
                  height: height * 1.7,
                  width: width * 1.7,
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
                top: -height * 0.7,
                left: -width * 0.85,
                child: Container(
                  height: height * 1.7,
                  width: width * 1.7,
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
                top: -height * 0.7,
                left: -width * 0.78,
                child: Container(
                  height: height * 1.5,
                  width: width * 1.5,
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
                top: height * 0.1,
                left: width * 0.1,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: width * 0.07,
                  child: Center(
                    child: Image.asset(
                      'assets/splash_images/Ellipse_3014-1-removebg-preview.png',
                      height: width * 0.14,
                      width: width * 0.14,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.2,
                left: width * 0.1,
                child: Text(
                  'Welcome to \nPRx.Care',
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.6,
                child: SizedBox(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Health,\nOne Tap Away',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black1,
                          fontSize: width * 0.07,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Connect with Specialized Doctors for your time & \nComprehensive Medical Consultations.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black1.withOpacity(0.5),
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed('/RegisterPage'),
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xff027DFF)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.04,
                                    color: const Color(0xff027DFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          GestureDetector(
                            onTap: () => Get.toNamed('/LoginPage'),
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.04,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'By signing up, you agree to our ',
                            style: TextStyle(
                              fontSize: width * 0.02,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0D2E41).withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              fontSize: width * 0.02,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff027DFF),
                            ),
                          ),
                          Text(
                            ' & ',
                            style: TextStyle(
                              fontSize: width * 0.02,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0D2E41).withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'Privacy Policy.',
                            style: TextStyle(
                              fontSize: width * 0.02,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff027DFF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
