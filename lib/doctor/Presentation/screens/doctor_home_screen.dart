


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../utils/colors.dart';
import '../../domain/providers/appointment_provider.dart';

import '../widgets/drawer.dart';
import '../widgets/appointment_item.dart';

class DoctorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: Text('SAPDOS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/Amol_prof.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Hello!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text('Dr. Amol', style: TextStyle(fontSize: 25)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child:
                  Text('Today\'s Appointments', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatusCard(
                   title: 'Pending Appointments',
                  count: '19/40',
                  color: const Color.fromARGB(255, 17, 67, 108), 
                ),
                _buildStatusCard(
                  title: 'Completed Appointments',
                  count: '21/40',
                  color: Colors.green, 
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color:AppColors.primary,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    DateFormat('EEEE, MMM d')
                        .format(appointmentProvider.selectedDate),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                ElevatedButton(
                   style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                  onPressed: () => _selectDate(context, AppointmentProvider()),
                  child: Icon(Icons.calendar_today),
                ),
              ],
            
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: appointmentProvider.patients.length,
                itemBuilder: (context, index) {
                  final patient = appointmentProvider.patients[index];
                  return AppointmentItem(
                    time: index == 0 ? '11:00 AM' : index == 1 ? '11:30 AM' : index == 2 ? '12:30 PM' : index == 3 ? '1:45 PM' : '3:00 PM',
                    patientName: patient.name,
                    patientAge: patient.age,
                    
                    status: index % 3 == 0 ? 'pending' : 'completed',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, AppointmentProvider appointmentProvider) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: appointmentProvider.selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2500),
    );
    if (picked != null && picked != appointmentProvider.selectedDate) {
      appointmentProvider.selectDate(picked);
    }
  }



    Widget _buildStatusCard({
  required String count,
  required Color color,
  required String title,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
    decoration: BoxDecoration(
      color: AppColors.secondary,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          
          children: [
            CircularProgressIndicator(
              value: 0.45, 
              strokeWidth: 08.0,
              color: Colors.white,
            ),
            Text(
              count,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            color:Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
}
    
      
