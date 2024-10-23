import 'package:flutter/material.dart';
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
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous screen
            },
          ),
          title: Text(
            'My Consultations',
            style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
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
                        child: const Center(
                          child: Text('Token no: 25'),
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
                                  color: AppColors.grey2,
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
                                      color: AppColors.grey5,
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
              ),
              const SizedBox(
                height: 20,
              ),
              heading('Map Towards Hospital'),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/locationicon.svg',
                    color: AppColors.blue,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '154/11, Bannerghatta Road Opp, Bangalore - 560 076',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 326,
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(10)),
                    child: const MapScreen(),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue),
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                          child: Text(
                        'I’m at Hospital',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('/DrInfo'),
                    child: Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                          child: Text(
                        'Report To Doctor/Nurse',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.blue),
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              heading('Need Help?'),
              const SizedBox(
                height: 10,
              ),
              Text(
                'If you can’t make it, please cancel or reschedule.',
                style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textcolor,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/reschedule.svg',
                    height: 24,
                    width: 24,
                    color: AppColors.textcolor2,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Reschedule',
                    style: TextStyle(
                        color: AppColors.textcolor2,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/cancel.svg',
                    height: 24,
                    width: 24,
                    color: AppColors.textcolor2,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cancel',
                    style: TextStyle(
                        color: AppColors.textcolor2,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
