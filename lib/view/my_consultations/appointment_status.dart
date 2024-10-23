import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';

import '../../constants/colors.dart';

class AppointmentStatus extends StatelessWidget {
  const AppointmentStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textcolor,
            size: 20.sp,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
        title: Text(
          'Appointment Status',
          style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200.h,
                  width: 326.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow, // Shadow color
                        offset: const Offset(
                            0, 10), // Horizontal and vertical offsets
                        blurRadius: 15.r, // Blur radius
                        spreadRadius: -3.r, // Spread radius
                      ),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: AppColors.bordercolor, // Border color
                      width: 1.w, // Border width
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35.h,
                        color: AppColors.bordercolor,
                        child: Center(
                          child: Text(
                            'Case Closed',
                            style: TextStyle(
                                color: AppColors.red1,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 20.h),
                        child: Text(
                          'Booking ID: XXXXXX',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clockicon.svg',
                              color: AppColors.grey4,
                              height: 16.67.h,
                              width: 16.67.w,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              'Sep, Wed 20 . 10:00 am - 10:30 am',
                              style: TextStyle(
                                  color:AppColors.grey2,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20.r,
                              backgroundImage: const AssetImage(
                                  'assets/homepageimages/Ellipse 190.png'),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Merin Jacob',
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Psychologists | Apollo hospital',
                                  style: TextStyle(
                                      color:AppColors.grey5,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  maxLines: 6,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.blue50),
                    ),
                      hintText: 'Write your review here...',
                      hintStyle:  TextStyle(color:AppColors.grey9),
                      filled: true,
                      fillColor:AppColors.white,
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide:  BorderSide(
                            color: AppColors.bordercolor1,
                          
                          ))),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ButtonCustom(name: 'Follow-Up', height: 35.h, width: 326.w)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
