import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';
import 'package:patient_journey_management/view/home_page/select_place.dart';

import '../../utilities/custom_widgets/headings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 1,
        toolbarHeight: 75,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('assets/homepageimages/Frame 586.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: AppColors.white1,
                          radius: 20,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.blue2,
                              size: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Add Member',
                        style: TextStyle(
                            color: AppColors.blue3,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
              ],
            ),
          ),
          const Spacer(),
          const SizedBox(width: 155, child: SelectPlace()),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
                // width: 326.w,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: TextFormField(
                    cursorColor: AppColors.grey2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 25),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.offwhite),
                      ),
                      border: const OutlineInputBorder(),
                      hintText:
                          'Search by Specialist/Category/Condition/Hospital',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          'assets/icons/searchicon.svg',
                          color: AppColors.grey,
                          height: 16.67,
                          width: 16.67,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.offwhite,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Get.toNamed('/AppointmentType'),
                        child: const BookAnAppointment()),
                    GestureDetector(
                        onTap: () => Get.toNamed('/AppointmentType'),
                        child: const TeleMedicine())
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              heading('Find Hospital near you'),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow, // Shadow color
                      offset: const Offset(
                          0, 10), // Horizontal and vertical offsets
                      blurRadius: 15, // Blur radius
                      spreadRadius: -3, // Spread radius
                    ),
                  ],
                ),
                constraints: const BoxConstraints(maxHeight: 270),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8, top: 10),
                          child: Stack(
                            children: [
                              Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      child: Image.asset(
                                        'assets/homepageimages/Image (2).png',
                                        height: 121,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 15, bottom: 5),
                                      child: Text(
                                        'Apollo Hospital',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/locationicon.svg',
                                            color: AppColors.grey3,
                                            fit: BoxFit.cover,
                                            height: 14,
                                            width: 14,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '123 Oak Street, CA 98765',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.grey3),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            '5.0',
                                            style: TextStyle(
                                                color: AppColors.grey3,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/starsicon.svg',
                                            height: 10,
                                            width: 10.7,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '(128 Reviews)',
                                            style: TextStyle(
                                                color: AppColors.grey3,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: AppColors.dividercolor,
                                      indent: 15,
                                      endIndent: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/kmicon.svg',
                                            height: 16,
                                            width: 16,
                                            color: AppColors.grey1,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '2.5 km/40min',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: AppColors.grey3),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heading('Doctor you Consulted'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: ContainerDr(
                        height: 95,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    heading('My Consultations'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(child: My_consultation()),
                    const SizedBox(
                      height: 20,
                    ),
                    heading('Featured Services'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container3(
                          text1: 'Second',
                          text2: 'Opinion',
                          path:
                              'assets/homepageimages/Frame 1000001455 (1).png',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container3(
                            text1: 'Peer',
                            text2: 'Review',
                            path: 'assets/homepageimages/Frame 1000001456.png')
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Container3(
                            text1: 'US',
                            text2: 'InPatient',
                            path:
                                'assets/homepageimages/Frame 1000001457.png')),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TeleMedicine extends StatelessWidget {
  const TeleMedicine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double containerSize = (MediaQuery.of(context).size.width - 70) / 2;
    return Container(
      height: containerSize,
      width: containerSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff449847),
            Color(0xff026005),
          ],
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.end,
                'Tele-\nMedicine',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15, // Responsive font size
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/arrowicon.svg',
                height: 24, // Responsive icon size
                color: AppColors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/homepageimages/TEE (1).png',
              fit: BoxFit.cover,
              height: 300,
            ),
          )
        ],
      ),
    );
  }
}

class BookAnAppointment extends StatelessWidget {
  const BookAnAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double containerSize = (MediaQuery.of(context).size.width - 70) / 2;
    return Container(
      height: containerSize,
      width: containerSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffD25DDD),
            Color(0xff914498),
          ],
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.end,
                'Book an \nAppointment',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15, // Responsive font size
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/arrowicon.svg',
                height: 24, // Responsive icon size
                color: AppColors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/homepageimages/BOO-removebg-preview1.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class My_consultation extends StatelessWidget {
  const My_consultation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow, // Shadow color
            offset: const Offset(0, 10), // Horizontal and vertical offsets
            blurRadius: 15, // Blur radius
            spreadRadius: -3, // Spread radius
          ),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.blue4.withOpacity(0.25), // Border color
          width: 1, // Border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking ID: XXXXXX',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      AssetImage('assets/homepageimages/Ellipse 190.png'),
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
            GestureDetector(
              onTap: () => Get.toNamed('MyConsultations'),
              child: const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  top: 20,
                ),
                child: ButtonCustom(
                  name: 'Click Here',
                  height: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Container3 extends StatelessWidget {
  String text1;
  String text2;
  String path;
  Container3(
      {super.key,
      required this.text1,
      required this.text2,
      required this.path});

  @override
  Widget build(BuildContext context) {
    double containerHeight = 200;
    double containerWidth = 150;
    return Stack(
      children: [
        Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                text2,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Positioned(
            right: 20,
            top: 20,
            child: SvgPicture.asset(
              'assets/icons/arrowicon.svg',
              color: AppColors.white,
              height: 24,
              width: 24,
            ))
      ],
    );
  }
}

class ContainerDr extends StatelessWidget {
  final double height;
  const ContainerDr({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow, // Shadow color
            offset: const Offset(0, 10), // Horizontal and vertical offsets
            blurRadius: 15, // Blur radius
            spreadRadius: -3, // Spread radius
          ),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.blue4.withOpacity(0.25), // Border color
          width: 1, // Border width
        ),
      ),
      child: Center(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CircleAvatar(
                radius: 20,
                backgroundImage:
                    AssetImage('assets/homepageimages/Ellipse 190.png'),
              ),
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
    );
  }
}
