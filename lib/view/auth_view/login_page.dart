import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/controller/auth_controller/auth_controller.dart';
import 'package:patient_journey_management/utilities/custom_widgets/bg_img.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            BgImg(),

            // Login elements

            Positioned(
              top: 321,
              left: 34,
              right: 34,
              child: Container(
                width: 295,
                height: 483,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
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
                        loginTextform(
                          textcontroller: emailController,
                          hinttext: 'Enter Your Email',
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
                          () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText:
                                  !authController.isPasswordVisible.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is Required';
                                }

                                return null;
                              },
                              cursorColor: AppColors.blue50,
                              decoration: InputDecoration(
                                focusColor: AppColors.blue7,
                                floatingLabelStyle:
                                    TextStyle(color: AppColors.blue),
                                filled: true,
                                fillColor: AppColors.white,
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
                                hintText: 'Enter password',
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff1A1C1E)),
                                border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffEDF1F3)),
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.error),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: AppColors.blue7)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                contentPadding: const EdgeInsets.all(12),
                              ),
                            ),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable text field container
  Container loginTextform({
    TextEditingController? textcontroller,
    String? hinttext,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: textcontroller,
        cursorColor: AppColors.blue50,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          floatingLabelStyle: TextStyle(color: AppColors.blue),
          hintText: hinttext,
          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff1A1C1E)),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffEDF1F3)),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.blue7)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.grey)),
          contentPadding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
