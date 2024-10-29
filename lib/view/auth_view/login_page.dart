import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/controller/auth_controller/auth_controller.dart';
import 'package:patient_journey_management/utilities/custom_widgets/bg_img.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';
import 'package:patient_journey_management/view/auth_view/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          BgImg(),
          // Login elements

          Positioned.fill(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 321),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Log In',
                            style: TextStyle(
                              color: AppColors.headline,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Enter your email and password to log in ",
                            style: TextStyle(
                                color: AppColors.grey10,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          // Email input
                          CustomWidgets().textFormField(
                            hinttext: 'Enter Your Email',
                            txtController: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                           // Password input
                          Obx(
                            () => CustomWidgets().textFormField(
                              hinttext: 'Enter Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  authController.togglePasswordVisibility();
                                },
                                icon: Icon(
                                  authController.isPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.grey,
                                ),
                              ),
                              txtController: passwordController,
                              obsecuretext:
                                  !authController.isPasswordVisible.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is Required';
                                }

                                return null;
                              },
                            ),
                          ),
                         

                          const SizedBox(height: 10),
                          // Forget password link
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/Forgetpasswordemail');
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: 'Forget Password?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          // Login button
                          Obx(
                            () => GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    authController.login();
                                  }
                                },
                                child: authController.isLoading.value
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.blue,
                                        ),
                                      )
                                    : const ButtonCustom(
                                        name: 'Log In',
                                        height: 48,
                                      )),
                          ),
                          const SizedBox(height: 20),
                          // Social sign-up options
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 2,
                                width: 90,
                                color: AppColors.white,
                              ),
                              Text(
                                'Or login with',
                                style: TextStyle(
                                    color: AppColors.grey10,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 2,
                                width: 90,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset('assets/icons/googleicon.svg'),
                              SvgPicture.asset('assets/icons/appleicon.svg'),
                              SvgPicture.asset('assets/icons/metaicon.svg'),
                              SvgPicture.asset('assets/icons/windowsicon.svg'),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account    ",
                                style: TextStyle(
                                    color: AppColors.grey10,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigate to sign-up page
                                  Get.toNamed('/RegisterPage');
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
