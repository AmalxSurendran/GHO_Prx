import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart'; // Ensure AppColors is defined in your constants/colors.dart file.

class ButtonCustom extends StatelessWidget {
  final double width;
  final double height;
  final String name;

  const ButtonCustom({
    required this.name,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF065FD5),
            Color(0xFF064DAB),
          ],
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
