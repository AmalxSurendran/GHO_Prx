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
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode phonenumberFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPassFocusNode = FocusNode();
  final FocusNode checkboxFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    // final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                            firstNameField(context),

                            const SizedBox(height: 5),
                            lastNameField(context),
                            const SizedBox(height: 5),
                            phonenumberTxtfield(context),
                            const SizedBox(
                              height: 5,
                            ),
                            emailField(context),
                            const SizedBox(
                              height: 5,
                            ),

                            passwordField(authController, context),
                            const SizedBox(
                              height: 5,
                            ),
                            confirmPassField(authController, context),

                            const SizedBox(
                              height: 5,
                            ),
                            chechBoxField(authController),
                            const SizedBox(
                              height: 5,
                            ),
                            // register button
                            registerButton(authController),
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

  Widget firstNameField(BuildContext context) => CustomWidgets().textFormField(
        hinttext: 'Enter first  name',
        txtController: firstnamecontroller,
        focusNode: firstNameFocusNode,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(lastNameFocusNode);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is Required';
          }

          return null;
        },
      );

  Widget lastNameField(BuildContext context) => CustomWidgets().textFormField(
        hinttext: 'Enter your last name',
        txtController: lastnamecontroller,
        focusNode: lastNameFocusNode,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(phonenumberFocusNode);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is Required';
          }

          return null;
        },
      );

  Widget phonenumberTxtfield(BuildContext context) {
    return IntlPhoneField(
      controller: phonecontroller,
      focusNode: phonenumberFocusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSubmitted: (value) {
        FocusScope.of(context).requestFocus(emailFocusNode);
      },
      initialCountryCode: 'IN',
      flagsButtonPadding: const EdgeInsets.all(5),
      pickerDialogStyle: PickerDialogStyle(
        width: 300,
        countryCodeStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      validator: (phone) {
        if (phone == null || phone.completeNumber.length < 10) {
          return 'Enter a valid phone number';
        }
        return null;
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

  Widget emailField(BuildContext context) => CustomWidgets().textFormField(
        hinttext: 'Enter your email',
        txtController: emailcontroller,
        focusNode: emailFocusNode,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(passwordFocusNode);
        },
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
      );
  Widget passwordField(AuthController authController, BuildContext context) =>
      Obx(
        () => CustomWidgets().textFormField(
          txtController: passwordcontroller,
          focusNode: passwordFocusNode,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(confirmPassFocusNode);
          },
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
          obsecuretext: !authController.isPasswordVisible.value,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is Required';
            }

            return null;
          },
        ),
      );

  Widget confirmPassField(
          AuthController authController, BuildContext context) =>
      Obx(
        () => CustomWidgets().textFormField(
          txtController: confirmcontroller,
          focusNode: confirmPassFocusNode,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(checkboxFocusNode);
          },
          hinttext: 'Confirm Password',
          suffixIcon: IconButton(
            onPressed: () {
              authController.toggleConfirmPasswordVisibility();
            },
            icon: Icon(
              !authController.isConfirmPasswordVisible.value
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: AppColors.grey,
            ),
          ),
          obsecuretext: !authController.isConfirmPasswordVisible.value,
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
      );

  Widget chechBoxField(AuthController authController) => Row(
        children: [
          Obx(
            () => Checkbox(
              value: authController.isChecked.value,
              focusNode: checkboxFocusNode,
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
      );

  Widget registerButton(AuthController authController) => Obx(
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
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: authController.isChecked.value
                            ? [
                                const Color(0xFF065FD5),
                                const Color(0xFF064DAB),
                              ]
                            : [AppColors.blue50, AppColors.blue50],
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
      );
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
    FocusNode? focusNode,
    Function(String)? onFieldSubmitted,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        obscureText: obsecuretext,
        controller: txtController,
        focusNode: focusNode,
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
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
