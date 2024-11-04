import 'package:flutter/material.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            'Profile',
            style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                Container(
                  height: 23,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.blue)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mode_edit_outline_outlined,
                        color: AppColors.blue,
                        size: 11,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 15, top: 20, bottom: 20, right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.blue),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Name',
                    style: TextStyle(fontSize: 14, color: AppColors.grey11),
                  ),
                  const Text(
                    'Smith',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'First Name',
                    style: TextStyle(fontSize: 14, color: AppColors.grey11),
                  ),
                  const Text(
                    'John',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 14, color: AppColors.grey11),
                  ),
                  const Text(
                    'john@gmail.com',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 14, color: AppColors.grey11),
                  ),
                  const Text(
                    '1234567890',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change Password',
                  style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                Container(
                  height: 23,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.blue)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mode_edit_outline_outlined,
                        color: AppColors.blue,
                        size: 11,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 15, top: 20, bottom: 20, right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.blue),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 14, color: AppColors.grey11),
                  ),
                  const Text(
                    'john@123',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
