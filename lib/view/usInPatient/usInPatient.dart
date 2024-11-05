import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class Usinpatient extends StatelessWidget {
  Usinpatient({super.key});

  List<Map<String, dynamic>> items = [
    {"number": "01", "text": "Visa Processing", "route": ""},
    {"number": "02", "text": "Flight Services", "route": ""},
    {"number": "03", "text": "Air Ambulance Services", "route": ""},
    {"number": "04", "text": "Appointment Booking", "route": ""},
    {"number": "05", "text": "Telehealth Services", "route": ""},
    {"number": "06", "text": "Support Services", "route": ""},
    {"number": "07", "text": "Local Transportation", "route": ""},
    {"number": "08", "text": "Translation Services", "route": ""},
    {"number": "09", "text": "Bank Transfers & Settlements", "route": ""},
    {"number": "10", "text": "Accommodation Arrangements", "route": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.textcolor,
              size: 20,
            ),
          ),
          title: Text(
            'Inpatient Services',
            style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffE1D335)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/homepageimages/nurse2.png',
                          height: 150,
                          width: 140,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 25, right: 80),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'At Global Health Opinion',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black2),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Seamless access to world-class inpatient care and exceptional support throughout your\njourney.',
                                style: TextStyle(color: AppColors.black2),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Peer Review Services',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 64,
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xffB2A833))),
                        child: Center(
                          child: Row(
                            children: [
                              Text(items[index]["number"]),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(items[index]["text"]),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Get.toNamed(items[index]["route"]);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
