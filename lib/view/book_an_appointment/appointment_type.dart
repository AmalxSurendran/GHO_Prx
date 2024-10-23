import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey_management/utilities/custom_widgets/headings.dart';
import 'package:patient_journey_management/view/book_an_appointment/select_hospital.dart';

import '../../constants/colors.dart';

class AppointmentType extends StatelessWidget {
  const AppointmentType({super.key});

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
            'Appointment Type',
            style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading('Choose Appointment Type'),
               SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    
                    context: context,
                    builder: (context) => const SelectHospital(),
                  );
                },
                child: ContainerCustom(
                  color:AppColors.grey6,
                  heading: 'Hospital',
                  text: 'Your journey to recovery starts here.',
                  path: 'assets/icons/hospitalicon.svg',
                ),
              ),
               SizedBox(
                height: 10.h,
              ),
              ContainerCustom(
                  heading: 'Clinic',
                  text: 'Your health is our priority—let’s check in!',
                  path: 'assets/icons/clinicicon.svg',
                  color:AppColors.yellowshade),
               SizedBox(
                height: 10.h,
              ),
              ContainerCustom(
                  heading: 'Specialist',
                  text: 'Expert insights for your specific health needs.',
                  path: 'assets/icons/speacialisticon.svg',
                  color:AppColors.redshade)
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerCustom extends StatelessWidget {
  String heading;
  String text;
  Color color;
  String path;
  ContainerCustom({
    super.key,
    required this.heading,
    required this.text,
    required this.path,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 326.w,
      decoration: BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(10.r)),
          image: const DecorationImage(
              image: AssetImage(
                  'assets/appointmentpageimages/containerbackground.jpeg'),
              opacity: 0.2,
              fit: BoxFit.cover),
          color: color),
      child: Padding(
        padding:  EdgeInsets.only(left: 20.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundColor: AppColors.white,
              child: Center(
                  child: SvgPicture.asset(
                path,
                height: 24.h,
                width: 24.w,
              )),
            ),
             SizedBox(
              height: 5.h,
            ),
            Text(
              heading,
              style:  TextStyle(
                  color: AppColors.textcolor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400),
            ),
             SizedBox(
              height: 5.h,
            ),
            Text(
              text,
              style:  TextStyle(
                  color: AppColors.textcolor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
