import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/utilities/custom_widgets/headings.dart';
import 'package:patient_journey_management/view/book_an_appointment/select_hospital.dart';

import '../../constants/colors.dart';

class AppointmentType extends StatelessWidget {
  const AppointmentType({super.key});

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
            'Appointment Type',
            style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading('Choose Appointment Type'),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const SelectHospital(),
                  );
                },
                child: ContainerCustom(
                  color: AppColors.grey6,
                  heading: 'Hospital',
                  text: 'Your journey to recovery starts here.',
                  path: 'assets/icons/hospitalicon.svg',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                 Get.toNamed('/SelectHospital');//SelectClinic
                },
                child: ContainerCustom(
                    heading: 'Clinic',
                    text: 'Your health is our priority—let’s check in!',
                    path: 'assets/icons/clinicicon.svg',
                    color: AppColors.yellowshade),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                   Get.toNamed('/SelectHospital');//SelectSpeciality
                },
                child: ContainerCustom(
                    heading: 'Specialist',
                    text: 'Expert insights for your specific health needs.',
                    path: 'assets/icons/speacialisticon.svg',
                    color: AppColors.redshade),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerCustom extends StatelessWidget {
  String heading;
  String text;
  Color color;
  String path;
  ContainerCustom({
    super.key,
    required this.heading,
    required this.text,
    required this.path,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 326,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: const DecorationImage(
                image: AssetImage(
                    'assets/appointmentpageimages/containerbackground.jpeg'),
                opacity: 0.2,
                fit: BoxFit.cover),
            color: color),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.white,
                child: Center(
                    child: SvgPicture.asset(
                  path,
                  height: 24,
                  width: 24,
                )),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                heading,
                style: TextStyle(
                    color: AppColors.textcolor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: TextStyle(
                    color: AppColors.textcolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
