import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class PeerReview extends StatelessWidget {
  const PeerReview({super.key});

  @override
  Widget build(BuildContext context) {
    double containerSize = (MediaQuery.of(context).size.width - 60) / 2;
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
            'Peer Review',
            style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff914498)),
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
                                    color: AppColors.white3),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Top-tier medical care with peer reviews, second opinions, multi-specialty reviews, and board evaluations from our global network of specialists.',
                                style: TextStyle(color: AppColors.white3),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Peer Review Services',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerNew(
                      containerSize: containerSize,
                      num: '01',
                      heading: 'Global\nExpertise:',
                      text:
                          'Access to a\nnetwork of top\nspecialists\nworldwide.',
                    ),
                    ContainerNew(
                      containerSize: containerSize,
                      num: '02',
                      heading: 'Objective\nAssessments:',
                      text:
                          'Independent\nevaluation of\ndiagnoses and\ntreatment plans.',
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerNew(
                      containerSize: containerSize,
                      num: '03',
                      heading: 'Quality\nAssurance:',
                      text: 'Ensures\nadherence to\nglobal medical\nstandards.',
                    ),
                    ContainerNew(
                      containerSize: containerSize,
                      num: '04',
                      heading: 'Error\nIdentification:',
                      text:
                          'Helps prevent\nadverse\noutcomes and\nimprove care.',
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Why Choose Us?',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Listtile(
                  heading: 'Patient-Centered Approach:',
                  text2: 'We prioritize your needs and well-being.',
                ),
                Listtile(
                  heading: 'Comprehensive Reviews:',
                  text2: 'Get a thorough evaluation of your medical case.',
                ),
                Listtile(
                  heading: 'Global Network: ',
                  text2: 'Benefit from expertise from around the world.',
                ),
                Listtile(
                  heading: 'Confidentiality:',
                  text2:
                      'Your medical information is treated with the utmost privacy.',
                )
              ],
            ),
          ),
        ));
  }
}

class Listtile extends StatelessWidget {
  String? heading;
  String? text2;
  Listtile({super.key, this.heading, this.text2});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: AppColors.blue,
      leading: const Icon(
        Icons.circle,
        size: 15,
      ),
      title: Text(
        heading!,
        style: TextStyle(
            color: AppColors.blue, fontWeight: FontWeight.w700, fontSize: 18),
      ),
      subtitle: Text(text2!),
    );
  }
}

class ContainerNew extends StatelessWidget {
  ContainerNew(
      {super.key,
      required this.containerSize,
      this.num,
      this.heading,
      this.text});

  final double containerSize;
  String? num;
  String? heading;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize,
      width: containerSize,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff914498),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  num!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  heading!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text('        '),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  text!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
