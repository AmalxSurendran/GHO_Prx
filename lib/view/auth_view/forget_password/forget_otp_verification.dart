import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/bg_img.dart';
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
    width: 60,
    height: 50,
    textStyle: const TextStyle(color: Colors.black, fontSize: 18),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.transparent),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            BgImg(),
      
            // otp elements
      
            Positioned.fill(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 320,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1A000000),
                              blurRadius: 12,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              'Verify OTP',
                              style: TextStyle(
                                color: AppColors.headline,
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 25),
                            Pinput(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                } else if (value.length != 6) {
                                  return 'Enter a valid OTP of 6 digits';
                                } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                                  return 'OTP should contain only numbers';
                                }
                                return null;
                              },
                              length: 6,
                              defaultPinTheme: defaultPinTheme.copyWith(
                                  height: 46,
                                  width: 46,
                                  textStyle: TextStyle(
                                      color: AppColors.blue6,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  decoration: BoxDecoration(
                                      color: AppColors.dividercolor,
                                      border: Border.all(
                                        color: AppColors.blue7,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                              focusedPinTheme: defaultPinTheme.copyWith(
                                  height: 46,
                                  width: 45,
                                  textStyle: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  decoration: defaultPinTheme.decoration!
                                      .copyWith(
                                          color: AppColors.blue,
                                          border:
                                              Border.all(color: AppColors.blue7),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                              onCompleted: (value) {
                                otpController.text = value;
                              },
                            ),
                            const SizedBox(height: 25),
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
                                  borderRadius: BorderRadius.circular(10),
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
                                      ? LoadingAnimationWidget.fourRotatingDots(
                                          color: AppColors.white,
                                          size: 24,
                                        )
                                      : Text(
                                          'Verify',
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 14),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
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
                            const SizedBox(height: 25),
                          ],
                        ),
                      ),
                    ],
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
