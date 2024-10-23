import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/view/my_bookings/appointmentpage.dart';
import 'package:patient_journey_management/view/home_page/homepage.dart';
import 'package:patient_journey_management/view/notifications/notificationpage.dart';
import 'package:patient_journey_management/view/profile_page/profilepage.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentindex = 0;
  List<Widget> pages = [
    const HomePage(),
    const Notificationpage(),
     const AppointmentPage(),
    const Profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentindex],
      bottomNavigationBar: Container(
        height: 70.h,
        color:AppColors.white, // Bottom Navigation Bar Background
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < pages.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentindex = i;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Circle background behind the selected icon
                    if (_currentindex == i)
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors
                              .iconbackground, // Change the color as needed
                        ),
                      ),
                    // Icon
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          getIconPath(i),
                          height: 20.h,
                          color: _currentindex == i
                              ? AppColors.blue
                              : AppColors.grey1,
                        ),
                        // Optional: Add text labels below icons if needed
                        // Text(getLabel(i), style: TextStyle(color: _currentindex == i ? AppColors.blue : AppColors.grey1)),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String getIconPath(int index) {
    switch (index) {
      case 0:
        return 'assets/icons/homepageicon.svg'; // home page icon
      case 1:
        return 'assets/icons/notificationpageicon.svg'; // notification page icon
      case 2:
        return 'assets/icons/appointmentpageicon.svg'; // appointment page icon
      case 3:
        return 'assets/icons/profilepageicon.svg'; // profile page icon
      default:
        return '';
    }
  }

  // Optional: If you want to add labels below icons
  String getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Notifications';
      case 2:
        return 'Appointments';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}
