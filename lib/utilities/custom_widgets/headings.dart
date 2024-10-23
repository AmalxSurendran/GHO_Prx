import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_journey_management/constants/colors.dart';

Text heading( String heading) {
    return  Text(
                heading,
                style:  TextStyle(
                    fontSize: 20.h,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textcolor),
              );
  }