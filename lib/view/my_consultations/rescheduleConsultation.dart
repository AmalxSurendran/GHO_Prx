import 'package:flutter/material.dart';

class RescheduleConsultation extends StatelessWidget {
  const RescheduleConsultation({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
          title: const Text('Cancel'),
          content: const Text('This is an alert message. Do you want to Reschedule?'),
          actions: [
            TextButton(
              child: const Text('NO'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert box
              },
            ),
            TextButton(
              child: const Text('YES'),
              onPressed: () {
                // Perform an action when 'OK' is pressed
                Navigator.of(context).pop(); // Close the alert box
              },
            ),
          ],
        );
  }
}