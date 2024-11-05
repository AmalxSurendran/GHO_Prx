import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/view/my_consultations/cancelConsultation.dart';
import 'package:patient_journey_management/view/my_consultations/rescheduleConsultation.dart';

class UpComing extends StatelessWidget {
  const UpComing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
                // Return the Container

                width: 342,
                height: 247,
                decoration: BoxDecoration(
                  color:AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color:AppColors.shadow1, // First shadow color
                      offset: const Offset(0, 4), // Shadow position
                      blurRadius: 6, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                    BoxShadow(
                      color: AppColors.shadow, // Second shadow color
                      offset: const Offset(0, 10), // Shadow position
                      blurRadius: 15, // Blur radius
                      spreadRadius: -3, // Negative spread radius
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'May 22, 2024 - 10.00 AM',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color:AppColors.textcolor1),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                       Divider(
                        color:AppColors.dividercolor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 109,
                            width: 109,
                            decoration: BoxDecoration(
                                color:AppColors.grey,
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/appointmentpageimages/Image.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. James Robinson',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textcolor2),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Orthopedic Surgery',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:AppColors.grey7),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/locationicon.svg',
                                      color: AppColors.grey7,
                                      fit: BoxFit.cover,
                                      height: 14,
                                      width: 14,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Elite Ortho Clinic, USA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color:AppColors.grey7),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                       Divider(
                        color:AppColors.dividercolor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => showDialog(context: context,
                              builder: (context)=>Cancelconsultation(),),
                            child: Container(
                              height: 37,
                              width: 147,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.blue),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: AppColors.blue),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => showDialog(context: context,
                              builder: (context) => RescheduleConsultation(), ),
                            child: Container(
                              height: 37,
                              width: 147,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.blue),
                                  color: AppColors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Reschedule',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: AppColors.white),
                              )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
