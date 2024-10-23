import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:pinput/pinput.dart';

class Forgetpasswordotp extends StatefulWidget {
  const Forgetpasswordotp({super.key});

  @override
  _ForgetpasswordotpState createState() => _ForgetpasswordotpState();
}

class _ForgetpasswordotpState extends State<Forgetpasswordotp> {
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final defaultPinTheme = PinTheme(
    
    width: 60.h,
    height: 50.w,
    textStyle: const TextStyle(color: Colors.black, fontSize: 18),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.transparent),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Positioned(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  'assets/homepageimages/Sign Up.png',
                  fit: BoxFit.cover,
                )),

            // Login elements

            Positioned(
              top: size.height / 5,
              left: 25,
              right: 25,
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 12,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         
                          Column(
                            children: [
                              SizedBox(height: 15.h),
                              Text(
                                'Verify OTP',
                                style: TextStyle(
                                  color: AppColors.headline,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Enter the OTP",
                                style: TextStyle(color: AppColors.grey10),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "We just sent you on your registered email",
                                style: TextStyle(color: AppColors.grey10),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 25.h),
                              Pinput(
                                
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  } else if (value.length != 6) {
                                    return 'Enter a valid OTP of 6 digits';
                                  } else if (!RegExp(r'^\d+$')
                                      .hasMatch(value)) {
                                    return 'OTP should contain only numbers';
                                  }
                                  return null;
                                },
                                length: 6,
                          
                                 defaultPinTheme: defaultPinTheme.copyWith(

                              height: 46.h,
                              width: 46.w,
                              textStyle: TextStyle(
                                  color: AppColors.blue6,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.blue7,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r))),
                          focusedPinTheme: defaultPinTheme.copyWith(
                              height: 46.h,
                              width: 45.w,
                              textStyle: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold),
                              decoration: defaultPinTheme.decoration!
                                  .copyWith(
                                      color: AppColors.blue,
                                      border:
                                          Border.all(color: AppColors.blue7),
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                          
                                onCompleted: (value) {
                                  otpController.text = value;
                                },
                              ),
                              SizedBox(height: 25.h),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                                    
                                    // Simulate loading and perform your verification action here
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                                    
                                    setState(() {
                                      isLoading = false;
                                    });
                                                    
                                    Get.offNamed('/CreateNewPassword');
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(10.r),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF065FD5),
                                        Color(0xFF064DAB),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: isLoading
                                        ? LoadingAnimationWidget
                                            .fourRotatingDots(
                                            color: AppColors.white,
                                            size: 24.w,
                                          )
                                        : Text(
                                            'Verify',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 14.sp),
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Didn't get the code?  ",
                                    style: TextStyle(color: AppColors.grey10),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      // Resend OTP action
                                    },
                                    child: Text(
                                      'Resend',
                                      style: TextStyle(
                                          color: AppColors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25.h),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
