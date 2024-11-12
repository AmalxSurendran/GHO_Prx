import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/bg_img.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';
import 'package:patient_journey_management/view/auth_view/register_page.dart';
import '../../controller/auth_controller/authController.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key}) {
    Get.put(AuthController());
  }

  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isPasswordHidden = true.obs;
  final RxBool isLoading = false.obs;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            BgImg(),
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
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            // Email input
                            CustomWidgets().textFormField(
                              hinttext: 'Enter Your Email',
                              focusNode: emailFocusNode,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(passwordFocusNode);
                              },
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
                            Obx(() => CustomWidgets().textFormField(
                                  hinttext: 'Enter Password',
                                  focusNode: passwordFocusNode,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      isPasswordHidden.value =
                                          !isPasswordHidden.value;
                                    },
                                    icon: Icon(
                                      isPasswordHidden.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  txtController: passwordController,
                                  obsecuretext: isPasswordHidden.value,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is Required';
                                    }
                                    return null;
                                  },
                                )),
                            const SizedBox(height: 10),
                            // Forget password link
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/Forgetpasswordemail');
                                },
                                child: Text(
                                  'Forget Password?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            // Login button
                            Obx(() => GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      isLoading.value =
                                          true; // Show loading indicator
                                      await authController.signIn(
                                          emailController.text.trim(),
                                          passwordController.text.trim());
                                      isLoading.value =
                                          false; // Hide loading indicator
                                    }
                                  },
                                  child: isLoading.value
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.blue,
                                          ),
                                        )
                                      : const ButtonCustom(
                                          name: 'Log In',
                                          height: 48,
                                        ),
                                )),
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
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 90,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Social icons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 20),
                                GestureDetector(
                                    onTap: () async {
                                      // Add Google login logic
                                      User? user = await authController
                                          .signInWithGoogle();
                                      if (user != null) {
                                        // Navigate to home or another page after successful sign-in
                                        Navigator.pushReplacementNamed(
                                            context, '/homepage');
                                      }
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/googleicon.svg')),
                                GestureDetector(
                                    onTap: () {
                                      // Add Apple login logic
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/appleicon.svg')),
                                GestureDetector(
                                    onTap: () {
                                      // Add Meta (Facebook) login logic
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/metaicon.svg')),
                                GestureDetector(
                                    onTap: () {
                                      // Add Windows login logic
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/windowsicon.svg')),
                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Sign up option
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account    ",
                                  style: TextStyle(
                                    color: AppColors.grey10,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed('/RegisterPage');
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
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
      ),
    );
  }
}
