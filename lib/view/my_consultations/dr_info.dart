import 'package:flutter/material.dart';
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
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context); // Navigates back to the previous screen
              },
            ),
            title: Text(
              'Doctor’s Info',
              style: TextStyle(
                  color: AppColors.textcolor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/homepageimages/Doctors info.png',
                height: 200,
                width: 374,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    width: 326,
                    height: 400,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: AppColors.dividercolor1,
                          indent: 110,
                          endIndent: 110,
                          thickness: 3,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Dr. Merin Jacob',
                              style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            Text(
                              '4.8',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey5),
                            ),
                            Icon(
                              Icons.star,
                              size: 17,
                              color: AppColors.yellow,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Psychologists ',
                          style: TextStyle(
                              color: AppColors.grey5,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Text(
                              'Apollo hospital at 3rd Floor',
                              style: TextStyle(
                                  color: AppColors.grey5,
                                  fontSize: 16,
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
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/clockicon.svg',
                                height: 18, width: 18, color: AppColors.grey5),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '10:30am - 5:30pm',
                              style: TextStyle(
                                  color: AppColors.grey5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: AppColors.dividercolor1,
                        ),
                        const SizedBox(
                          height: 15,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Experience',
                                  style: TextStyle(
                                      color: AppColors.grey5,
                                      fontSize: 16,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Treated',
                                  style: TextStyle(
                                      color: AppColors.grey5,
                                      fontSize: 16,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Hourly Rate',
                                  style: TextStyle(
                                      color: AppColors.grey5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/AppointmentStatus'),
                          child: const ButtonCustom(
                              name: 'Report', height: 56, width: 284),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
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
      height: 140,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                  fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text2,
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            ),
            Text(
              text3!,
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
