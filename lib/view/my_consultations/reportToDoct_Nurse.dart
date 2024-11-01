import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class ReporttodoctNurse extends StatelessWidget {
  const ReporttodoctNurse({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textcolor,
            size: 20,
          ),
        ),
        title: Text(
          'Report',
          style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),),
      body: Center(child: Text('Report to Doctor or Nurse\n(no functionality added)'),),);
  }
}