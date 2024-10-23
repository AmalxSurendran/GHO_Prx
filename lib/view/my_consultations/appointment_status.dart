import 'package:flutter/material.dart';
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
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
        title: Text(
          'Appointment Status',
          style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 326,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow, // Shadow color
                        offset: const Offset(
                            0, 10), // Horizontal and vertical offsets
                        blurRadius: 15, // Blur radius
                        spreadRadius: -3, // Spread radius
                      ),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.bordercolor, // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        color: AppColors.bordercolor,
                        child: Center(
                          child: Text(
                            'Case Closed',
                            style: TextStyle(
                                color: AppColors.red1,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'Booking ID: XXXXXX',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clockicon.svg',
                              color: AppColors.grey4,
                              height: 16.67,
                              width: 16.67,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Sep, Wed 20 . 10:00 am - 10:30 am',
                              style: TextStyle(
                                  color:AppColors.grey2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  'assets/homepageimages/Ellipse 190.png'),
                            ),
                            const SizedBox(
                              width: 10,
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
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Psychologists | Apollo hospital',
                                  style: TextStyle(
                                      color:AppColors.grey5,
                                      fontSize: 12,
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
                const SizedBox(
                  height: 20,
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(
                            color: AppColors.bordercolor1,
                          
                          ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ButtonCustom(name: 'Follow-Up', height: 35, width: 326)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
