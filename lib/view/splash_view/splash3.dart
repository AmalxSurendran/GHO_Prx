import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              top: 280.h,
              left: 20.w,
              right: 20.w,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 105.h,
                      width: 105.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.blue7)),
                      child: Center(
                        child: Container(
                          height: 100.h,
                          width: 100.w,
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Your Health,\nOne Tap Away',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff0D2E41),
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Connect with Specialized Doctors for your time & \n Comprehensive Medical Consultations.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff0D2E41).withOpacity(0.5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed('/RegisterPage'),
                          child: Container(
                            height: 37.h,
                            width: 147.w,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xff027DFF)),
                                borderRadius: BorderRadius.circular(4.r)),
                            child: Center(
                                child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  color: const Color(0xff027DFF)),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/LoginPage'),
                          child: Container(
                            height: 37.h,
                            width: 147.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
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
                                  fontSize: 14.sp,
                                  color: AppColors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By signing up, you agree to our ',
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0D2E41).withOpacity(0.5)),
                        ),
                        Text(
                          'Terms and Conditions',
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff027DFF)),
                        ),
                        Text(
                          '& ',
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0D2E41).withOpacity(0.5)),
                        ),
                        Text(
                          'Privacy Policy.',
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff027DFF)),
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
