import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/controller/auth_controller/auth_controller.dart';
import 'package:patient_journey_management/utilities/custom_widgets/bg_img.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController firstnamecontroller = TextEditingController();

  final TextEditingController lastnamecontroller = TextEditingController();

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController confirmcontroller = TextEditingController();

  final TextEditingController phonecontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const BgImg(),
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 300,
                    ),
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
                          titleSignup(),
                          const SizedBox(
                            height: 10,
                          ),
                          textAlreadyaccount(),
                          const SizedBox(
                            height: 20,
                          ),
                          firstNameField(),

                          const SizedBox(height: 5),
                          lastNameField(),
                          const SizedBox(height: 5),
                          phonenumberTxtfield(),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomWidgets().textFormField(
                            hinttext: 'Enter your email',
                            txtController: emailcontroller,
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
                          const SizedBox(
                            height: 5,
                          ),

                          Obx(
                            () => CustomWidgets().textFormField(
                              txtController: passwordcontroller,
                              hinttext: 'Enter Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  authController.togglePasswordVisibility();
                                },
                                icon: Icon(
                                  !authController.isPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.grey,
                                ),
                              ),
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
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => CustomWidgets().textFormField(
                              txtController: confirmcontroller,
                              hinttext: 'Confirm Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  authController
                                      .toggleConfirmPasswordVisibility();
                                },
                                icon: Icon(
                                  !authController.isConfirmPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.grey,
                                ),
                              ),
                              obsecuretext: !authController
                                  .isConfirmPasswordVisible.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is Required';
                                }
                                if (value != passwordcontroller.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                          ),

                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: authController.isChecked.value,
                                  onChanged: (value) {
                                    authController.isCheckedvisibility();
                                  },
                                  activeColor: AppColors.blue,
                                  checkColor: AppColors.white,
                                  side: BorderSide(
                                    color: AppColors.blue,
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              Text(
                                "I agree to the ",
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Terms of Service ",
                                style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "& ",
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 5,
                          ),
                          // register button
                          Obx(
                            () => GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate() &&
                                      authController.isChecked.value) {
                                    authController.register();
                                  }
                                },
                                child: authController.isLoading.value
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.blue,
                                        ),
                                      )
                                    : Container(
                                        width: 279,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors:
                                                authController.isChecked.value
                                                    ? [
                                                        const Color(0xFF065FD5),
                                                        const Color(0xFF064DAB),
                                                      ]
                                                    : [
                                                        AppColors.blue50,
                                                        AppColors.blue50
                                                      ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            " Sign Up",
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )),
                          ),
                          const SizedBox(
                            height: 10,
                          )
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
  ///////////////////////////////////////////////////////////////////////////////

  Widget titleSignup() => Text(
        'Sign Up',
        style: TextStyle(
            color: AppColors.headline,
            fontWeight: FontWeight.w700,
            fontSize: 32),
      );

  Widget textAlreadyaccount() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account    ",
            style: TextStyle(
                color: AppColors.grey10,
                fontSize: 12,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          InkWell(
            onTap: () {
              Get.toNamed('/LoginPage');
            },
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  Widget firstNameField() => CustomWidgets().textFormField(
        hinttext: 'Enter first  name',
        txtController: lastnamecontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is Required';
          }

          return null;
        },
      );

  Widget lastNameField() => CustomWidgets().textFormField(
        hinttext: 'Enter your last name',
        txtController: firstnamecontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is Required';
          }

          return null;
        },
      );
  Widget phonenumberTxtfield() {
    return IntlPhoneField(
      controller: phonecontroller,
      initialCountryCode: 'IN',
      flagsButtonPadding: const EdgeInsets.all(5),
      pickerDialogStyle: PickerDialogStyle(
        width: 300,
        countryCodeStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        if (value == null || !value.isValidNumber()) {
          return 'Please enter your phone number';
        }
        return null; // Return null if the input is valid
      },
      invalidNumberMessage: 'Enter valid PhoneNumber',
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        floatingLabelStyle: TextStyle(color: AppColors.blue),
        hintText: 'Phone Number',
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
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}

class CustomWidgets {
  Container textFormField({
    TextEditingController? txtController,
    String? hinttext,
    Widget? prefixIcon,
    TextInputType keyboardtype = TextInputType.text,
    String? Function(String?)? validator,
    IconButton? suffixIcon,
    bool obsecuretext = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        obscureText: obsecuretext,
        controller: txtController,
        cursorColor: AppColors.blue50,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          floatingLabelStyle: TextStyle(color: AppColors.blue),
          suffixIcon: suffixIcon,
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
