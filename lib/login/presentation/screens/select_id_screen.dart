
import 'package:flutter/material.dart';
import '../../../doctor/Presentation/screens/doctor_home_screen.dart';
import '../../../patient/models/screens/patient_home_screen.dart';
import '../../../utils/colors.dart';


class SelectIdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final iconSize = screenWidth / 4;
    final iconheight = screenheight / 6;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.background,
              child: Center(
                child: Image.asset('assets/doctor.png'), 
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView( // Add this widget
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'SAPDOS',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 100),
                    Text(
                      'Choose your role to continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.text,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorHomeScreen()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/dr_logo.jpg', 
                            width: iconSize,
                            height: iconheight,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Doctor',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientHomeScreen()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/patients_logos.jpg', 
                            width: iconSize,
                            height: iconheight,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Patient',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        // Handle proceed as guest
                      },
                      child: Text(
                        'Proceed as a Guest',
                        style: TextStyle(
                          color: AppColors.text,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
