
import 'package:flutter/material.dart';
import '../../../main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _isDarkModeEnabled =true; // 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Appearance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Dark Mode'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                setState(() {
                  _isDarkModeEnabled = !_isDarkModeEnabled;
                  _toggleTheme();
                });
              },
            ),
            // Add more settings widgets as needed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isDarkModeEnabled = !_isDarkModeEnabled;
            _toggleTheme();
          });
        },
        child: Icon(Icons.brightness_medium),
      ),
    );
  }

  // Toggle between dark and light themes
  void _toggleTheme() {
    if (_isDarkModeEnabled) {
      _setDarkMode();
    } else {
      _setLightMode();
    }
  }

  // Function to set Dark mode
  void _setDarkMode() {
    var darkTheme = ThemeData.dark();
    MyApp.setTheme(darkTheme); // Assuming MyApp has a method to set the theme
  }

  // Function to set Light mode
  void _setLightMode() {
    var lightTheme = ThemeData.light();
    MyApp.setTheme(lightTheme); // Assuming MyApp has a method to set the theme
  }
}
