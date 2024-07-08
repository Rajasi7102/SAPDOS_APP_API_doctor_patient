
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../doctor/Presentation/screens/chat_screen.dart';
import '../../../doctor/Presentation/screens/setting_page.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../../../utils/colors.dart';
import '../../data/domain/providers/doctor_provider.dart';
import '../../presentation/widgets/doctor_card.dart';
import 'booking_appointment_screen.dart';



class PatientHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    final doctors = doctorProvider.doctors;

    return Scaffold(
      appBar: AppBar(
        title: Text('SAPDOS'),
         
         
        backgroundColor: AppColors.secondary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'SAPDOS',
                style: TextStyle(color: Colors.white, fontSize: 34,),
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
            ),
            ListTile(
              leading: Icon(Icons.category, color: AppColors.primary),
              title: Text('Categories',
                  style: TextStyle(color: AppColors.primary)),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: AppColors.primary),
              title: Text('Appointment',
                  style: TextStyle(color: AppColors.primary)),
              onTap: () {
                 Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => BookingAppointmentScreen()),
             ); },
            ),
           
             ListTile(
            leading: Icon(Icons.chat, color: AppColors.text),
            title: Text('Chat', style: TextStyle(color: AppColors.text)),
            onTap: () {
        Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => ChatApp()), 
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
      ),
      body: Container(
        color: AppColors.background,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWideScreen = constraints.maxWidth >= 600;
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/images/myprofile.jpg'), 
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello!',
                            style:
                                TextStyle(fontSize: 24, color: AppColors.text,fontWeight:FontWeight.bold),
                          ),
                          Text(
                            'Rajeshwari Nehete',
                            style:
                                TextStyle(fontSize: 20, color: AppColors.text),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isWideScreen ? 2 : 1,
                      childAspectRatio:
                          isWideScreen ? 3.6 : 2.6, 
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return DoctorCard(doctor: doctors[index]);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
