import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class SelectClinic extends StatelessWidget {
  const SelectClinic({super.key});

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
          'Select Clinic',
          style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),),
      body: const Center(child: Text('(no functionality added)'),),
    );
  }
}