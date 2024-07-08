// // lib/screens/auth_screen.dart


import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

import 'login_screen.dart';
import 'register_screen.dart';
import 'select_id_screen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth / 4;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.background,
              child: Center(
                child:
                    Image.asset('assets/doctor.png'), 
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                  SizedBox(height: 150),
                  Text(
                    'Login to your sapdos account or',
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                
                  Text(
                    'Create one now.',
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: buttonWidth,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('LOGIN',
                      style: TextStyle(
                     color: Colors.white, // Set the text color to white
                     ),
                      
                      
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: buttonWidth,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('SIGN-UP',
                      style: TextStyle(
                      color: Colors.white,
                       // Set the text color to white
                      ),
                      
                      
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectIdScreen()),);
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
        ],
      ),
    );
  }
}
