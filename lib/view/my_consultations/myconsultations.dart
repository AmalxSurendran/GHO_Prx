import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/utilities/custom_widgets/headings.dart';
import 'package:patient_journey_management/view/my_consultations/map_screen.dart';

import '../../constants/colors.dart';

class MyConsultations extends StatelessWidget {
  const MyConsultations({super.key});

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
            'My Consultations',
            style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          )),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Container(
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
                        child: const Center(
                          child: Text('Token no: 25'),
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
                                  color: AppColors.grey2,
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
                                      color: AppColors.grey5,
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
              ),
              SizedBox(
                height: 20.h,
              ),
              heading('Map Towards Hospital'),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/locationicon.svg',
                    color: AppColors.blue,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '154/11, Bannerghatta Road Opp, Bangalore - 560 076',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 200.h,
                width: 326.w,
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(10.r)),
                    child: const MapScreen(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 35.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue),
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Center(
                          child: Text(
                        'I’m at Hospital',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: AppColors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('/DrInfo'),
                    child: Container(
                      height: 35.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Center(
                          child: Text(
                        'Report To Doctor/Nurse',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: AppColors.blue),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              heading('Need Help?'),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'If you can’t make it, please cancel or reschedule.',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textcolor,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/reschedule.svg',
                    height: 24.h,
                    width: 24.w,
                    color: AppColors.textcolor2,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Reschedule',
                    style: TextStyle(
                        color: AppColors.textcolor2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/cancel.svg',
                    height: 24.h,
                    width: 24.w,
                    color: AppColors.textcolor2,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Cancel',
                    style: TextStyle(
                        color: AppColors.textcolor2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
