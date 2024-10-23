import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';
import 'package:patient_journey_management/view/home_page/select_place.dart';

import '../../utilities/custom_widgets/headings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'image': 'assets/homepageimages/second opinion from doctor.png',
        'text': 'Book an ',
        'text2': 'Appointment ',
        'route': '/AppointmentType'
      },
      {
        'image': 'assets/homepageimages/telemedicine.png',
        'text': 'Tele -  ',
        'text2': 'medicine  ',
        'route': '/AppointmentType'
      },
    ];

    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 1.w,
          toolbarHeight: 75.h,
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundImage:
                          const AssetImage('assets/homepageimages/Frame 586.png'),
                    ),
                  ),
                  
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 32,
                          width: 32,
                          child: CircleAvatar(
                            backgroundColor: AppColors.white1,
                            radius: 20.r,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: AppColors.blue2,
                                size: 10.sp,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Add Member',
                          style: TextStyle(
                              color: AppColors.blue3,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(width: 155.w, child: const SelectPlace())
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48.h,
                  // width: 326.w,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: TextFormField(
                      cursorColor: AppColors.grey2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 25.h),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.offwhite),
                        ),
                        border: const OutlineInputBorder(),
                        hintText:
                            'Search by Specialist/Category/Condition/Hospital',
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(15.w),
                          child: SvgPicture.asset(
                            'assets/icons/searchicon.svg',
                            color: AppColors.grey,
                            height: 16.67.h,
                            width: 16.67.w,
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                          fontSize: 12.sp,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.offwhite,
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(items[index]['route']),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.r), // Responsive corner radius
                        child: Stack(
                          children: [
                            // Image that fills the container
                            Image.asset(
                              items[index]['image'],
                              fit: BoxFit.cover,
                              width: double
                                  .infinity, // Ensures it covers the container width
                              height: double
                                  .infinity, // Ensures it covers the container height
                            ),
                            // Text placed inside the container using Padding to ensure it's always inside
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 30.h),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Text with responsive size but contained within padding
                                    Text(
                                      items[index]['text'],
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 15.sp, // Responsive font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                        height:
                                            5.h), // Adds spacing between texts
                                    Text(
                                      items[index]['text2'],
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 15.sp, // Responsive font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Icon positioned at the bottom-right, also inside padding
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: 30.h, right: 20.w),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/arrowicon.svg',
                                    height: 24.h, // Responsive icon size
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: items.length,
                ),
                heading('Find Hospital near you'),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow, // Shadow color
                        offset: Offset(
                            0.w, 10.h), // Horizontal and vertical offsets
                        blurRadius: 15.r, // Blur radius
                        spreadRadius: -3.r, // Spread radius
                      ),
                    ],
                  ),
                  constraints: BoxConstraints(maxHeight: 270.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.w, top: 10.h),
                            child: Stack(
                              children: [
                                Container(
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.r),
                                            topRight: Radius.circular(8.r)),
                                        child: Image.asset(
                                          'assets/homepageimages/Image (2).png',
                                          height: 121.h,
                                          width: 200.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.w, top: 15.h, bottom: 5.h),
                                        child: Text(
                                          'Apollo Hospital',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14.sp),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/locationicon.svg',
                                              color: AppColors.grey3,
                                              fit: BoxFit.cover,
                                              height: 14.h,
                                              width: 14.w,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              '123 Oak Street, CA 98765',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: AppColors.grey3),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.w, top: 5.h),
                                        child: Row(
                                          children: [
                                            Text(
                                              '5.0',
                                              style: TextStyle(
                                                  color: AppColors.grey3,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12.sp),
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/starsicon.svg',
                                              height: 10.h,
                                              width: 10.7.w,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              '(128 Reviews)',
                                              style: TextStyle(
                                                  color: AppColors.grey3,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: AppColors.dividercolor,
                                        indent: 15.w,
                                        endIndent: 15.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.w, top: 5.h),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/kmicon.svg',
                                              height: 16.h,
                                              width: 16.w,
                                              color: AppColors.grey1,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              '2.5 km/40min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                  color: AppColors.grey3),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                heading('Doctor you Consulted'),
                SizedBox(
                  height: 10.h,
                ),
                ContainerDr(
                  height: 95.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                heading('My Consultations'),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 250.h,
                  width: 326.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow, // Shadow color
                        offset: const Offset(
                            0, 10), // Horizontal and vertical offsets
                        blurRadius: 15..r, // Blur radius
                        spreadRadius: -3.r, // Spread radius
                      ),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: AppColors.blue4.withOpacity(0.25), // Border color
                      width: 1.w, // Border width
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          'Booking ID: XXXXXX',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clockicon.svg',
                              color: AppColors.grey4,
                              height: 16.67.h,
                              width: 16.67.h,
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
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
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
                        GestureDetector(
                          onTap: () => Get.toNamed('MyConsultations'),
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 20.w, top: 20.h, bottom: 20.h),
                            child: ButtonCustom(
                                name: 'Click Here', height: 35.h, width: 291.w),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                heading('Featured Services'),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container3(
                        text1: 'Second',
                        text2: 'Opinion',
                        path: 'assets/homepageimages/Frame 1000001455 (1).png',
                      ),
                      Container3(
                          text1: 'Peer',
                          text2: 'Review',
                          path: 'assets/homepageimages/Frame 1000001456.png')
                    ],
                  ),
                ),
                Center(
                    child: Container3(
                        text1: 'US',
                        text2: 'InPatient',
                        path: 'assets/homepageimages/Frame 1000001457.png')),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Container3 extends StatelessWidget {
  String text1;
  String text2;
  String path;
  Container3(
      {super.key,
      required this.text1,
      required this.text2,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.h,
          width: 150.w,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          left: 10.w,
          top: 10.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                text2,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Positioned(
            right: 20.w,
            top: 20.h,
            child: SvgPicture.asset(
              'assets/icons/arrowicon.svg',
              color: AppColors.white,
              height: 24.h,
              width: 24.w,
            ))
      ],
    );
  }
}

class ContainerDr extends StatelessWidget {
  final double height;
  const ContainerDr({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 326.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow, // Shadow color
            offset: const Offset(0, 10), // Horizontal and vertical offsets
            blurRadius: 15.r, // Blur radius
            spreadRadius: -3.r, // Spread radius
          ),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.blue4.withOpacity(0.25), // Border color
          width: 1.w, // Border width
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage:
                    const AssetImage('assets/homepageimages/Ellipse 190.png'),
              ),
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
    );
  }
}
