import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BgImg extends StatelessWidget {
  const BgImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -106,
          left: -12,
          child: Container(
            height: 352,
            width: 352,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  const Color(0xffC72FF8),
                  const Color(0xffC72FF8).withOpacity(0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -56,
            left: -43,
            child: Container(
              height: 352,
              width: 352,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    const Color(0xff2F56F8),
                    const Color(0xffC630F8).withOpacity(0),
                  ],
                ),
              ),
            )),
        Positioned(
            top: -84,
            left: -74,
            child: Container(
              height: 352,
              width: 352,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xff3AF9EF),
                    Color(0xff5264F9),
                  ],
                ),
              ),
            )),
        Positioned(
            top: 50,
            left: 49,
            child: Image.asset(
              'assets/splash_images/Ellipse 3014-1.png',
              height: 48,
              width: 49,
            )),
        Positioned(
            top: 121,
            left: 44,
            child: Text(
              'Welcome to \nGHOPRx',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white),
            )),
      ],
    );
  }
}
