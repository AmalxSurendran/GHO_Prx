import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textcolor,
            size: 20,
          ),
        ),
        title: Text(
          'Privacy Policy',
          style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),),
      body: Center(child: Text('(no functionality added)'),),
    );
  }
}