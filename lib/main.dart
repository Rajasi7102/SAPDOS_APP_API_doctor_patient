import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'doctor/domain/providers/appointment_provider.dart';
import 'login/domain/providers/auth_provider.dart';
import 'login/presentation/screens/auth_screen.dart';
import 'patient/data/domain/providers/doctor_provider.dart';
import 'utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static void setTheme(ThemeData darkTheme) {}
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
      ],
      child: MaterialApp(
        title: 'Sapdos',
        debugShowCheckedModeBanner: false,

        theme: isDarkMode ? _buildDarkTheme() : _buildLightTheme(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.secondary,
            title: Text('Sapdos', style: TextStyle(color: isDarkMode ? Colors.white : const Color.fromARGB(255, 1, 53, 95),fontSize: 25,
            ),
           ),
          ),
          body: AuthScreen(),
          floatingActionButton: FloatingActionButton(
            onPressed: _toggleTheme,
            child: Icon(Icons.sunny),
          ),
        ),
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.accent,
      brightness: Brightness.light,

     
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.accent,
      brightness: Brightness.dark,
      
    
    );
  }
}
