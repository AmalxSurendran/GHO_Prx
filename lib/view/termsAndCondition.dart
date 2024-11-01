import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

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
          'Terms and Condition',
          style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),),
      body: Center(child: Text('(no functionality added)'),),
    );
  }
}