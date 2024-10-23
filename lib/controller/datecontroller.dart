import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class DateController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var selectedTimeSlot = ''.obs; // Observable for selected time slot
  var calendarFormat = CalendarFormat.month.obs; // Observable for calendar format

  // List of available dates for the selected doctor
  final List<DateTime> availableDays = [
    DateTime.utc(2024, 10, 14),
    DateTime.utc(2024, 10, 15),
    DateTime.utc(2024, 10, 16),
    DateTime.utc(2024, 10, 17),
    // Add more available days if needed
  ];

  // Check if the selected day is available
  bool isAvailable(DateTime day) {
    return availableDays.any((availableDay) => isSameDay(availableDay, day));
  }

  // Update selected and focused day
  void updateSelectedDay(DateTime newSelectedDay, DateTime newFocusedDay) {
    if (isAvailable(newSelectedDay)) {
      selectedDay.value = newSelectedDay;
      focusedDay.value = newFocusedDay;
    }
  }

  // Update selected time slot
  void updateSelectedTimeSlot(String newTimeSlot) {
    selectedTimeSlot.value = newTimeSlot;
  }
}
