import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import go_router package

class SomeOtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to BloodReportScreen
        context.go('/blood_report');
      },
      child: Text('View Blood Report'),
    );
  }
}
