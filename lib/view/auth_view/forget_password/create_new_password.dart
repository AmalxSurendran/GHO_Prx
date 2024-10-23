import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:patient_journey_management/constants/colors.dart';

class CreateNewPassword extends StatefulWidget {
  CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController newpasscontroller = TextEditingController();
  final TextEditingController confirmpasscontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value != newpasscontroller.text) {
      return 'Passwords do not match';
    }
    return null;
  }

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
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create new password',
                            style: TextStyle(
                                color: AppColors.blue6,
                                fontWeight: FontWeight.w700,
                                fontSize: 28.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Your new password must be different from previously used password",
                            style: TextStyle(
                                color: AppColors.grey2, fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: TextFormField(
                              controller: newpasscontroller,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is Required';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }

                                return null;
                              },
                              cursorColor: AppColors.blue50,
                              decoration: InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: AppColors.blue),
                                filled: true,
                                fillColor: AppColors.white,
                                border: OutlineInputBorder(),
                                labelText: 'Enter  New Password',
                                labelStyle: TextStyle(
                                    color: AppColors.labelcolor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.white),
                                    borderRadius: BorderRadius.circular(10.r)),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide:
                                        BorderSide(color: AppColors.blue)),
                                contentPadding: EdgeInsets.all(12.w),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: TextFormField(
                              controller: confirmpasscontroller,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is Required';
                                }
                                if (value != newpasscontroller.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              cursorColor: AppColors.blue50,
                              decoration: InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: AppColors.blue),
                                filled: true,
                                fillColor: AppColors.white,
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(
                                    color: AppColors.labelcolor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.white),
                                    borderRadius: BorderRadius.circular(10.r)),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide:
                                        BorderSide(color: AppColors.blue)),
                                contentPadding: EdgeInsets.all(12.w),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: () async {
                              try {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  // Simulate loading
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Get.offNamed('/LoginPage');
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('$e'.toString())));
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 55.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
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
                                        size: 24.sp,
                                      )
                                    : Text(
                                        'Reset Password',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          )
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
