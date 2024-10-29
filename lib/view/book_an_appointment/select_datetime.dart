import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/controller/datecontroller.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../utilities/custom_widgets/headings.dart';
import '../home_page/homepage.dart';

class SelectDateAndTime extends StatelessWidget {
  const SelectDateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    final DateController dateController = Get.put(DateController());

    // Sample time slots
    final List<String> timeSlots = [
      "09:00 AM",
      "09:30 AM",
      "10:00 AM",
      "10:30 AM",
      "11:00 AM",
      "11:30 AM",
      "12:00 PM",
      "3:00 PM",
      "6:00 PM",
      "7:00 PM",
      "8:00 PM",
      "10:00 PM",
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textcolor,
            size: 20,
          ),
          onPressed: () {
            Get.back(); // Using GetX for navigation
          },
        ),
        title: Text(
          'Select Date & Time',
          style: TextStyle(
            color: AppColors.textcolor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const ContainerDr(
                  height: 90), // Assuming ContainerDr is a custom widget
              const SizedBox(height: 10),
              heading('Select Date'),
              const SizedBox(height: 10),

              // Calendar inside a container
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow1.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Obx(() => TableCalendar(
                      rowHeight: 35,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: dateController.focusedDay.value,
                      selectedDayPredicate: (day) =>
                          isSameDay(dateController.selectedDay.value, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        // Use DateController to update selected day
                        dateController.updateSelectedDay(
                            selectedDay, focusedDay);
                      },
                      onFormatChanged: (format) {
                        dateController.calendarFormat.value = format;
                      },
                      onPageChanged: (focusedDay) {
                        dateController.focusedDay.value = focusedDay;
                      },
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: false,
                        selectedTextStyle: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: AppColors.blue50,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle
                          
                        ),
                        
                        outsideDaysVisible: true,
                        outsideTextStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          rightChevronIcon: Icon(Icons.arrow_right),
                          leftChevronVisible: false,
                          headerMargin: EdgeInsets.only(left: 5),
                          titleTextStyle: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14)),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey8,
                            fontSize: 12),
                        weekendStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey8,
                            fontSize: 12),
                      ),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          // Highlight available dates using the controller method
                          if (dateController.isAvailable(day)) {
                            return Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors
                                      .white5, // Highlight available date
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                child: Center(
                                  child: Text(
                                    '${day.day}',
                                    style: TextStyle(
                                      color: AppColors
                                          .blue, // Text color for available date
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return null; // Default styling for other dates
                        },
                      ),
                    )),
              ),
              // Time slot selection
              const SizedBox(height: 15),
              heading('Select Hour'),
              const SizedBox(height: 15),

              // Grid for time slots
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  return Obx(() => ElevatedButton(
                        onPressed: () {
                          dateController
                              .updateSelectedTimeSlot(timeSlots[index]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              dateController.selectedTimeSlot.value ==
                                      timeSlots[index]
                                  ? AppColors.blue
                                  : AppColors.white,
                          foregroundColor:
                              dateController.selectedTimeSlot.value ==
                                      timeSlots[index]
                                  ? AppColors.white
                                  : AppColors.grey1,
                          side: BorderSide(color: AppColors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          timeSlots[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: dateController.selectedTimeSlot.value ==
                                    timeSlots[index]
                                ? AppColors.white
                                : AppColors.grey3,
                          ),
                        ),
                      ));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ScheduleAppointment();
                      },
                    );
                  },
                  child: const ButtonCustom(
                      name: 'Schedule Appointment', height: 48, )),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleAppointment extends StatelessWidget {
  const ScheduleAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Container(
          color: AppColors.blue6.withOpacity(0.1),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 341,
              height: 400,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/appointmentpageimages/Image (1).png',
                      height: 131,
                      width: 131,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    heading('Appointment Confirmed!'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your appointment with Dr. Merin Jacob is',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey3),
                    ),
                    Text(
                      'confirmed for June 25, 2024, at 10:00 am',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey3),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () => Get.toNamed('/CustomBottomNavigationBar'),
                        child: const ButtonCustom(
                            name: 'Done', height: 48, width: 245)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Edit your appointment ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
