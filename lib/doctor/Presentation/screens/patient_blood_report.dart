import 'package:flutter/material.dart';
class BloodReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Patient Name: Pritam Wagh',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Date: 2024-07-02',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Hemoglobin (Hb): 13.5 g/dL',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Hematocrit (Hct): 40.5%',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Red Blood Cell Count (RBC): 4.5 million/μL',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'White Blood Cell Count (WBC): 6,000/μL',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Platelet Count: 250,000/μL',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}