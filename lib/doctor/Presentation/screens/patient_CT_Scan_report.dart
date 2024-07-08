import 'package:flutter/material.dart';

class CTScanReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CT Scan Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( 
          child: Column(
            children: [
              // Patient Information
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Patient Name: Pritam Wagh',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Date of Birth: 1992-02-12',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Age: 32',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // CT Scan Information
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'CT Scan Date: 2024-07-02',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Scan Type: Abdominal',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Scan Result:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Normal',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // CT Scan Images
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'CT Scan Images:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Image.asset('assets/ctscan1.jpg',
                     
                      width: 150.0,
                      
                      ), // Replace with your image asset
                      SizedBox(height: 10),
                      Image.asset('assets/ctscan2.jpg',
                     
                      width: 150.0,
                      ), // Replace with your image asset
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Doctor's Notes
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Doctor's Notes:",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'The CT scan reveals no abnormalities in the abdominal region.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}