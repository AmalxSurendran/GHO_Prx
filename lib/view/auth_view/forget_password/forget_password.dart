import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/bg_img.dart';
import 'package:patient_journey_management/view/auth_view/register_page.dart';

class Forgetpasswordemail extends StatefulWidget {
  const Forgetpasswordemail({super.key});

  @override
  _ForgetpasswordemailState createState() => _ForgetpasswordemailState();
}

class _ForgetpasswordemailState extends State<Forgetpasswordemail> {
  final TextEditingController emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            const BgImg(),
            SingleChildScrollView(
              // Wrap the entire body with a SingleChildScrollView
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 324),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
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
                            Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: AppColors.headline,
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Enter your Email",
                              style: TextStyle(color: AppColors.grey2),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "We will send you a verification code.",
                              style: TextStyle(color: AppColors.grey2),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 25),
                            CustomWidgets().textFormField(
                                hinttext: 'Your Email',
                                txtController: emailcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field cannot be empty';
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}")
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 15),
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
      
                                  await Future.delayed(
                                      const Duration(seconds: 2));
      
                                  setState(() {
                                    isLoading = false;
                                  });
      
                                  Get.toNamed('/Forgetpasswordotp');
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
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
                                          'Continue',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
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
