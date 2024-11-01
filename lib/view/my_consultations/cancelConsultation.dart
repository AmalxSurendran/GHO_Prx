import 'package:flutter/material.dart';

class Cancelconsultation extends StatelessWidget {
  const Cancelconsultation({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
          title: Text('Cancel'),
          content: Text('This is an alert message. Do you want to cancel the Consultation?'),
          actions: [
            TextButton(
              child: Text('NO'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert box
              },
            ),
            TextButton(
              child: Text('YES'),
              onPressed: () {
                // Perform an action when 'OK' is pressed
                Navigator.of(context).pop(); // Close the alert box
              },
            ),
          ],
        );
  }
}