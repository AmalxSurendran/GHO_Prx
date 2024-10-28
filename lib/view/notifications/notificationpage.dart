import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () => Get.back(),
        //   icon: Icon(
        //     Icons.arrow_back_ios_rounded,
        //     color: AppColors.textcolor,
        //     size: 20,
        //   ),
        // ),
        title: Text(
          'Notifications',
          style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'TODAY',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color:AppColors.grey3),
                  ),
                  const Spacer(),
                  Text(
                    'Mark all as read',
                    style: TextStyle(
                        color:AppColors.blue5,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: AppColors.white,
              leading: CircleAvatar(
                radius: 35,
                backgroundColor:AppColors.white2,
                child: Center(
                    child: SvgPicture.asset(
                        'assets/icons/sucessappointmenticon.svg')),
              ),
              title: Row(
                children: [
                  const Text(
                    'Appointment Success',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Text(
                    '1h',
                    style: TextStyle(
                        color: AppColors.grey3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              subtitle: Text(
                'You have successfully booked your appointment with Dr. Emily Walker.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:AppColors.grey3),
              ),
            ),
            ListTile(
              tileColor: AppColors.white,
              leading: CircleAvatar(
                radius: 35,
                backgroundColor:AppColors.bordercolor1,
                child: Center(
                    child: SvgPicture.asset(
                        'assets/icons/cancelappointmenticon.svg')),
              ),
              title: Row(
                children: [
                  const Text(
                    'Appointment Cancelled',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Text(
                    '2h',
                    style: TextStyle(
                        color:AppColors.grey3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              subtitle: Text(
                'You have successfully cancelled your appointment with Dr. David Patel.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:AppColors.grey3),
              ),
            ),
            ListTile(
              tileColor: AppColors.white,
              leading: CircleAvatar(
                radius: 35,
                backgroundColor:AppColors.iconbackground,
                child: Center(
                    child: SvgPicture.asset(
                        'assets/icons/schedulechangeicon.svg')),
              ),
              title: Row(
                children: [
                  const Text(
                    'Scheduled Changed',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Text(
                    '8h',
                    style: TextStyle(
                        color:AppColors.grey3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              subtitle: Text(
                'You have successfully changes your appointment with Dr. Jesica Turner.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:AppColors.grey3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'YESTERDAY',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color:AppColors.grey3),
                  ),
                  const Spacer(),
                  Text(
                    'Mark all as read',
                    style: TextStyle(
                        color: AppColors.blue5,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            ListTile(
              tileColor:AppColors.white,
              leading: CircleAvatar(
                radius: 35,
                backgroundColor:AppColors.white2,
                child: Center(
                    child: SvgPicture.asset(
                        'assets/icons/sucessappointmenticon.svg')),
              ),
              title: Row(
                children: [
                  const Text(
                    'Appointment Success',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Text(
                    '1d',
                    style: TextStyle(
                        color:AppColors.grey3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              subtitle: Text(
                'You have successfully booked your appointment with Dr. David Patel.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:AppColors.grey3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
