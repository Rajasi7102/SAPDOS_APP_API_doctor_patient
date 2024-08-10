// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/validators - Copy.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'register_screen.dart';
import 'select_id_screen.dart'; 


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool _rememberMe = false;

  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleRememberMe(bool? value) {
    setState(() {
      _rememberMe = value ?? false;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectIdScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final inputFieldWidth = screenWidth / 4;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.background,
              child: Center(
                child:
                    Image.asset('assets/doctor.png'), // Replace with your asset
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SAPDOS',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter existing account\'s details',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.text,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: inputFieldWidth,
                      child: CustomTextField(
                        controller: emailController,
                        labelText: 'Email address/ Phone No.',
                        prefixIcon: Icon(Icons.email),
                        toggleVisibility: () {}, 
                         validator: Validators.validateEmail, hintText: 'abcd@gmail.com',
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: inputFieldWidth,
                      child: CustomTextField(
                        controller: passwordController,
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        obscureText: _obscureText,
                        toggleVisibility: _togglePasswordVisibility,
                        suffixIcon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ), 
                        validator: Validators.validatePassword, hintText: 'Rajeshwari@123',
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: inputFieldWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: _toggleRememberMe,
                              ),
                              Text('Remember me'),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle forgot password
                            },
                            child: Text('Forgot Password?'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'LOGIN',
                      onPressed: _login,
                      color: AppColors.primary,
                      textColor: AppColors.textColor,
                      width: inputFieldWidth,
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      child: Text(
                        'Not on Sapdos? Sign-up',
                        style: TextStyle(decoration: TextDecoration.underline),
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

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import '../../../utils/colors.dart';

// // import '../../../utils/validators - Copy.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/custom_button.dart';
// import 'register_screen.dart';
// import 'select_id_screen.dart'; // Import the SelectIdScreen

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool _obscureText = true;
//   bool _rememberMe = false;
//   bool _isLoading = false;

//   final _formKey = GlobalKey<FormState>();
//   final _storage = FlutterSecureStorage();

//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   void _toggleRememberMe(bool? value) {
//     setState(() {
//       _rememberMe = value ?? false;
//     });
//   }

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       String email = emailController.text;
//       String password = passwordController.text;

//       String apiUrl = 'https://sapdos-api-v2.azurewebsites.net/api/Credentials/Login';

//       try {
//         var response = await http.post(
//           Uri.parse(apiUrl),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'email': email, 'password': password}),
//         );

//         if (response.statusCode == 200) {
//           var jsonResponse = json.decode(response.body);
//           String token = jsonResponse['token'];

//           // Save the token securely
//           await _storage.write(key: 'auth_token', value: token);

//           // Navigate to the SelectIdScreen
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => SelectIdScreen()),
//           );
//         } else {
//           // Handle error response
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Login failed: ${response.body}')),
//           );
//         }
//       } catch (e) {
//         // Handle exceptions
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: $e')),
//         );
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final inputFieldWidth = screenWidth / 4;

//     return Scaffold(
//       body: Row(
//         children: [
//           Expanded(
//             child: Container(
//               color: AppColors.background,
//               child: Center(
//                 child: Image.asset('assets/doctor.png'), 
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'SAPDOS',
//                       style: TextStyle(
//                         fontSize: 45,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primary,
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Text(
//                       'Welcome Back',
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: AppColors.primary,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Enter existing account\'s details',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: AppColors.text,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 30),
//                     Container(
//                       width: inputFieldWidth,
//                       child: CustomTextField(
//                         controller: emailController,
//                         labelText: 'Email address/ Phone No.',
//                         prefixIcon: Icon(Icons.email),
//                         toggleVisibility: () {},
                     
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
                          
//                           return null;
//                         }, hintText: 'abcd@gmal.com',
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Container(
//                       width: inputFieldWidth,
//                       child: CustomTextField(
//                         controller: passwordController,
//                         labelText: 'Password',
//                         prefixIcon: Icon(Icons.lock),
//                         obscureText: _obscureText,
//                         toggleVisibility: _togglePasswordVisibility,
//                         suffixIcon: Icon(
//                           _obscureText ? Icons.visibility_off : Icons.visibility,
//                         ),
                       
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
                     
//                           return null;
//                         }, hintText: 'Rajeshwari@123',
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Container(
//                       width: inputFieldWidth,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: _rememberMe,
//                                 onChanged: _toggleRememberMe,
//                               ),
//                               Text('Remember me'),
//                             ],
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               // Handle forgot password
//                             },
//                             child: Text('Forgot Password?'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     _isLoading
//                         ? CircularProgressIndicator()
                  
//                         : CustomButton(
//                             text: 'LOGIN',
//                             onPressed: _login,
//                             color: AppColors.primary,
//                             textColor: Colors.white,
//                             width:inputFieldWidth, 
                        
//                           ),
//                     SizedBox(height: 20),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => RegisterScreen()),
//                         );
//                       },
//                       child: Text(
//                         'Not on Sapdos? Sign-up',
//                         style: TextStyle(decoration: TextDecoration.underline),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

