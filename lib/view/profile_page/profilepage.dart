import 'package:flutter/material.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
