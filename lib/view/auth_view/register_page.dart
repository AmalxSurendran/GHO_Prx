import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/bg_img.dart';

import '../../controller/auth_controller/authController.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key}) {
    Get.put(AuthController());
  }
  final AuthController authController = Get.find();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final RxBool isPasswordHidden =
      true.obs; // Observable for password visibility toggle
  final RxBool isConfirmPasswordHidden =
      true.obs; // Observable for confirm password visibility toggle
  final RxBool isChecked = false.obs; // Checkbox observable
  final RxBool isLoading = false.obs;

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
                            lastNameField(context),

                            const SizedBox(height: 5),
                            firstNameField(context),
                            const SizedBox(height: 5),
                            phonenumberTxtfield(context),
                            const SizedBox(
                              height: 5,
                            ),
                            emailField(context),
                            const SizedBox(
                              height: 5,
                            ),

                            passwordField(context),
                            const SizedBox(
                              height: 5,
                            ),
                            confirmPassField(context),

                            const SizedBox(
                              height: 5,
                            ),
                            chechBoxField(),
                            const SizedBox(
                              height: 5,
                            ),
                            // register button
                            registerButton(),
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

  Widget lastNameField(BuildContext context) => CustomWidgets().textFormField(
        hinttext: 'Enter your last name',
        txtController: lastNameController,
        focusNode: lastNameFocusNode,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(firstNameFocusNode);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is Required';
          }

          return null;
        },
      );

  Widget firstNameField(BuildContext context) => CustomWidgets().textFormField(
        hinttext: 'Enter your first name',
        txtController: firstNameController,
        focusNode: firstNameFocusNode,
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
      controller: phoneController,
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
        txtController: emailController,
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
  Widget passwordField(BuildContext context) => Obx(
        () => CustomWidgets().textFormField(
          txtController: passwordController,
          focusNode: passwordFocusNode,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(confirmPassFocusNode);
          },
          hinttext: 'Enter Password',
          suffixIcon: IconButton(
            onPressed: () {
              isPasswordHidden.value = !isPasswordHidden.value;
            },
            icon: Icon(
              isPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
              color: AppColors.grey,
            ),
          ),
          obsecuretext: isPasswordHidden.value,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is Required';
            }

            return null;
          },
        ),
      );

  Widget confirmPassField(BuildContext context) => Obx(
        () => CustomWidgets().textFormField(
          txtController: confirmPasswordController,
          focusNode: confirmPassFocusNode,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(checkboxFocusNode);
          },
          hinttext: 'Confirm Password',
          suffixIcon: IconButton(
            onPressed: () {
              isConfirmPasswordHidden.value =
                  !isConfirmPasswordHidden.value; // Toggle visibility
            },
            icon: Icon(
              isConfirmPasswordHidden.value
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: AppColors.grey,
            ),
          ),
          obsecuretext: isConfirmPasswordHidden.value,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is Required';
            }
            if (value != passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      );

  Widget chechBoxField() => Row(
        children: [
          Obx(
            () => Checkbox(
              value: isChecked.value,
              focusNode: checkboxFocusNode,
              onChanged: (value) {
                isChecked.value = value!;
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

  Widget registerButton() => Obx(
        () => GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate() && isChecked.value) {
                isLoading.value = true;
                await authController.signUp(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                  firstName: firstNameController.text.trim(),
                  lastName: lastNameController.text.trim(),
                  phoneNumber: phoneController.text.trim(),
                );
                isLoading.value = false;
              }
            },
            child: isLoading.value
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
                        colors: isChecked.value
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
