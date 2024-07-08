import 'package:flutter/material.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../../../utils/colors.dart';
import '../screens/chat_screen.dart';
import '../screens/doctor_home_screen.dart';
import '../screens/setting_page.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Text(
              'SAPDOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.category, color: AppColors.text),
            title: Text('Categories', style: TextStyle(color: AppColors.text)),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: AppColors.text),
            title: Text('Appointment', style: TextStyle(color: AppColors.text)),
             onTap: () {
        Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => DoctorHomeScreen()),// Replace ChatPage() with your actual chat page widget
        );}
            
           
          ),
          ListTile(
            leading: Icon(Icons.chat, color: AppColors.text),
            title: Text('Chat', style: TextStyle(color: AppColors.text)),
            onTap: () {
        Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => ChatApp()), // Replace ChatPage() with your actual chat page widget
        );}
          ),
          ListTile(
            leading: Icon(Icons.settings, color: AppColors.text),
            title: Text('Settings', style: TextStyle(color: AppColors.text)),
             onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> SettingsPage ()
              ),
              
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: AppColors.text),
            title: Text('Logout', style: TextStyle(color: AppColors.text)),
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> LoginScreen()
              ),
              
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChatPage {
}
