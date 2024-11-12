import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/bg_img.dart';
import 'package:patient_journey_management/view/auth_view/register_page.dart';

import '../../../controller/auth_controller/authController.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key});
  final AuthController authController = Get.find();
  final TextEditingController newpasscontroller = TextEditingController();
  final TextEditingController confirmpasscontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode newPassFocusNode = FocusNode();
  final FocusNode confirmPassFocusNode = FocusNode();
  final RxBool isLoading = false.obs;
  final RxBool isPasswordHidden = true.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            const BgImg(),
            Positioned.fill(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 300),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create new password',
                              style: TextStyle(
                                color: AppColors.blue6,
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Your new password must be different from previously used password",
                              style: TextStyle(
                                  color: AppColors.grey2, fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 25),
                            Obx(
                              () => CustomWidgets().textFormField(
                                hinttext: 'Create New Password',
                                txtController: newpasscontroller,
                                focusNode: newPassFocusNode,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(confirmPassFocusNode);
                                },
                                obsecuretext: isPasswordHidden.value,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomWidgets().textFormField(
                              hinttext: 'Confirm Password',
                              txtController: confirmpasscontroller,
                              focusNode: confirmPassFocusNode,
                              obsecuretext: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                                if (value != newpasscontroller.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 25),
                            GestureDetector(
                              onTap: () async {
                                try {
                                  if (_formKey.currentState!.validate()) {
                                    isLoading.value = true; // Show loading
                                    // Simulate a delay for password reset process
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    isLoading.value = false; // Hide loading

                                    // Implement actual password reset logic here (e.g., Firebase)
                                    Get.offNamed(
                                        '/LoginPage'); // Navigate to login page
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error: $e')));
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
                                child: Obx(
                                  () => Center(
                                    child: isLoading.value
                                        ? LoadingAnimationWidget
                                            .fourRotatingDots(
                                            color: AppColors.white,
                                            size: 24,
                                          )
                                        : Text(
                                            'Reset Password',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10)
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
