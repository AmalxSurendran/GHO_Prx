// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:patient_journey_management/constants/colors.dart';
// import 'package:patient_journey_management/controller/auth_controller/auth_controller.dart';
// import 'package:patient_journey_management/utilities/custom_widgets/button.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   // Password visibility state
//   bool isPasswordVisible = false;
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Stack(
//           children: [
//             // Background containers
//             Container(
//               width: size.width,
//               height: size.height,
//               color: AppColors.blue,
//             ),
//             Positioned(
//               top: size.height / 2,
//               child: Container(
//                 width: size.width,
//                 height: size.height / 1.5,
//                 color: AppColors.background,
//               ),
//             ),
//             // Login elements
//             Positioned(
//               left: size.width / 25,
//               right: size.width / 25,
//               top: 45,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     width: size.width / 8,
//                     height: size.height / 8,
//                     child: SvgPicture.asset('assets/icons/ghologo.svg'),
//                   ),
//                   Text(
//                     'Log In',
//                     style: TextStyle(
//                       color: AppColors.white3,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 36.sp,
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Don't have an account    ",
//                         style: TextStyle(
//                             color: AppColors.white,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 12.sp),
//                         textAlign: TextAlign.center,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           // Navigate to sign-up page
//                           Get.toNamed('/RegisterPage');
//                         },
//                         child: Text(
//                           "Sign Up",
//                           style: TextStyle(
//                             color: AppColors.white,
//                             decoration: TextDecoration.underline,
//                             decorationColor: AppColors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Positioned(
//               top: size.height / 3,
//               left: 25,
//               right: 25,
//               child: Container(
//                 width: size.width,
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(4),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color(0x1A000000),
//                       blurRadius: 12,
//                       offset: Offset(0, 0),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20.w,
//                     vertical: 15.h,
//                   ),
//                   child: Column(
//                     children: [
//                       // Email input
//                       loginTextform(
//                         textcontroller: emailController,

//                         hinttext: 'Enter Your Email',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           } else if (!RegExp(
//                                   r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}")
//                               .hasMatch(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20.h),
//                       // Password input
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4.r),
//                           border:
//                               Border.all(color: AppColors.blue7, width: 1.w),
//                         ),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                           controller: passwordController,
//                           obscureText: !isPasswordVisible,
//                           cursorColor: AppColors.blue,
//                           decoration: InputDecoration(
//                             suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   isPasswordVisible = !isPasswordVisible;
//                                 });
//                               },
//                               icon: Icon(
//                                 isPasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: AppColors.grey,
//                               ),
//                             ),
//                             hintStyle: TextStyle(fontSize: 14),
//                             hintText: 'Enter password',
//                             enabledBorder: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             contentPadding: EdgeInsets.all(12.w),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10.sp),
//                       // Forget password link
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: GestureDetector(
//                           onTap: () {
//                             Get.toNamed('/Forgetpasswordemail');
//                           },
//                           child: RichText(
//                             text: TextSpan(
//                               text: 'Forget Password?',
//                               style: TextStyle(
//                                 fontSize: 12.sp,
//                                 color: AppColors.blue,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 25.sp),
//                       // Login button
//                       GestureDetector(
//                         onTap: () async {
//                           try {
//                             if (_formKey.currentState!.validate()) {
//                               setState(() {
//                                 isLoading = true;
//                               });

//                               // Simulate a network call with a delay
//                               await Future.delayed(const Duration(seconds: 2));

//                               setState(() {
//                                 isLoading = false;
//                               });

//                               Get.offNamed('/CustomBottomNavigationBar');
//                             }
//                           } catch (e) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('$e'.toString())));
//                           }
//                         },
//                         child: isLoading
//                             ? Center(
//                                 child: CircularProgressIndicator(
//                                   color: AppColors.blue,
//                                 ),
//                               )
//                             : ButtonCustom(name: 'Login', height: 48.h, width: 279.w)
//                       ),
//                       SizedBox(height: 20.h),
//                       // Social sign-up options
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Or sign up using',
//                             style: TextStyle(
//                                 color: AppColors.grey10,
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           SvgPicture.asset('assets/icons/googleicon.svg'),
//                           SvgPicture.asset('assets/icons/appleicon.svg'),
//                           SvgPicture.asset('assets/icons/metaicon.svg'),
//                           SvgPicture.asset('assets/icons/windowsicon.svg'),
//                         ],
//                       ),
//                        SizedBox(height: 10.h),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Reusable text field container
//   Container loginTextform({
//     TextEditingController? textcontroller,
//     String? hinttext,
//     String? Function(String?)? validator,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4.r),
//         border: Border.all(color: AppColors.blue7, width: 1.w),
//       ),
//       child: TextFormField(
//         controller: textcontroller,
//         validator: validator,
//         cursorColor: AppColors.blue,
//         decoration: InputDecoration(
//           hintText: hinttext,
//           hintStyle: TextStyle(fontSize: 14),
//           enabledBorder: InputBorder.none,
//           errorBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.all(Radius.circular(85.r)),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.all(Radius.circular(85.r)),
//           ),
//           focusedBorder: InputBorder.none,
//           contentPadding: EdgeInsets.all(12.w),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/controller/auth_controller/auth_controller.dart';
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
            Positioned(
              top: -106,
              left: -12,
              child: Container(
                height: 352,
                width: 352,
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
                top: -56,
                left: -43,
                child: Container(
                  height: 352,
                  width: 352,
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
                )),
            Positioned(
                top: -84,
                left: -74,
                child: Container(
                  height: 352,
                  width: 352,
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
                )),
            Positioned(
                top: 50,
                left: 49,
                child: Image.asset(
                  'assets/splash_images/Ellipse 3014-1.png',
                  height: 48,
                  width: 49,
                )),
            Positioned(
                top: 121,
                left: 44,
                child: Text(
                  'Welcome to \nGHOPRx',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                )),

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
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: Color(0x1A000000),
                  //     blurRadius: 12,
                  //     offset: Offset(0, 0),
                  //   ),
                  // ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: SingleChildScrollView(
                    physics:const BouncingScrollPhysics(),
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
                                  borderSide: BorderSide(color: AppColors.error),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(10)),
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
