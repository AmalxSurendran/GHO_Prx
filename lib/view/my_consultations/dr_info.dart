import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';

import '../../constants/colors.dart';

class DrInfo extends StatelessWidget {
  const DrInfo({super.key});

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
              'Doctor’s Info',
              style: TextStyle(
                  color: AppColors.textcolor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/homepageimages/Doctors info.png',
                height: 200.h,
                width: 374.w,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                    width: 326.w,
                    height: 400.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: AppColors.dividercolor1,
                          indent: 110.w,
                          endIndent: 110.w,
                          thickness: 3,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Dr. Merin Jacob',
                              style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            Text(
                              '4.8',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey5),
                            ),
                            Icon(
                              Icons.star,
                              size: 17.sp,
                              color: AppColors.yellow,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(
                          'Psychologists ',
                          style: TextStyle(
                              color: AppColors.grey5,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Text(
                              'Apollo hospital at 3rd Floor',
                              style: TextStyle(
                                  color: AppColors.grey5,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.grey,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/clockicon.svg',
                                height: 18, width: 18, color: AppColors.grey5),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '10:30am - 5:30pm',
                              style: TextStyle(
                                  color: AppColors.grey5,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Divider(
                          color: AppColors.dividercolor1,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '15yr',
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Experience',
                                  style: TextStyle(
                                      color: AppColors.grey5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '50+',
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Treated',
                                  style: TextStyle(
                                      color: AppColors.grey5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '\$25.00',
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Hourly Rate',
                                  style: TextStyle(
                                      color: AppColors.grey5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/AppointmentStatus'),
                          child: ButtonCustom(
                              name: 'Report', height: 56.h, width: 284.w),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container2(
                      color: AppColors.red,
                      text1: 'Waiting Time:',
                      text2: '15 mins',
                      text3: '',
                    ),
                    Container2(
                      color: AppColors.green,
                      text1: 'Status:',
                      text2: 'You’re currently',
                      text3: '3rd line',
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class Container2 extends StatelessWidget {
  Color color;
  String text1;
  String text2;
  String? text3;
  Container2(
      {super.key,
      required this.color,
      required this.text1,
      required this.text2,
      this.text3});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 150.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          image: const DecorationImage(
              image:
                  AssetImage('assets/appointmentpageimages/containerbg2.jpeg'),
              opacity: 0.4,
              fit: BoxFit.cover),
          color: color),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              text2,
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp),
            ),
            Text(
              text3!,
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp),
            )
          ],
        ),
      ),
    );
  }
}
