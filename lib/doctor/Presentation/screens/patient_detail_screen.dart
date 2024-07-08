
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

import 'patient_CT_Scan_report.dart';
import 'patient_blood_report.dart';
import 'prescription.dart';

class PatientDetailScreen extends StatelessWidget {
  final String name;
  final int age;
  final String description;

  PatientDetailScreen({
    required this.name,
    required this.age,
    required this.description, required String gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
        backgroundColor: AppColors.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/patients_prof.jpg'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('$age years', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('Issue description',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),

              Text('Dear Dr. I am writing to request an appointment to discuss appointment recent health concerns.', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              _buildSection(
                context,
                title: 'Patient History',
                icon: Icons.history,
                children: [
                  ListTile(
                    title: Text('Blood report'),
                    trailing: Icon(Icons.visibility, color: AppColors.primary),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  BloodReportScreen()),
                        );
                    },
                  ),
                  ListTile(
                    title: Text('CT Scan report'),
                    trailing: Icon(Icons.visibility, color: AppColors.primary),
                    onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CTScanReportScreen()),
                        );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildSection(
                context,
                title: 'Prescription',
                icon: Icons.medication,
                children: [
                  ListTile(
                    title: Text('2 March 2024'),
                    trailing: Icon(Icons.visibility, color: AppColors.primary),
                    
                      onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>PrescriptionPatient ()),
                        );
                  
                
                    },
                  ),
                  ListTile(
                    title: Text(' 9 July 2024'),
                    trailing: Icon(Icons.visibility, color: AppColors.primary),
                     onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>PrescriptionPatient ()),
                        );
                  
                
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add, color: AppColors.primary),
                    title: Text('Add New Prescription'),
                       onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>PrescriptionPatient ()),
                        );
                  
                
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title,
      required IconData icon,
      required List<Widget> children}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        backgroundColor: AppColors.primary,
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: TextStyle(color: Colors.white)),
        children: children.map((child) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: child,
          );
        }).toList(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http; // Import http package
// import 'dart:convert'; // Import for JSON decoding
// import '../../../utils/colors.dart';

// import 'patient_CT_Scan_report.dart';
// import 'patient_blood_report.dart';




// class PatientDetailScreen extends StatefulWidget {
//   final String name;
//   final int age;
//   final String description;
//   final String gender; // Added gender parameter

//   PatientDetailScreen({
//     required this.name,
//     required this.age,
//     required this.description,
//     required this.gender,
//   });

//   @override
//   _PatientDetailScreenState createState() => _PatientDetailScreenState();
// }

// class _PatientDetailScreenState extends State<PatientDetailScreen> {
//   late Future<dynamic> _patientData;

//   @override
//   void initState() {
//     super.initState();
//     _patientData = fetchPatientData();
//   }

//   Future<dynamic> fetchPatientData() async {
//     final url =
//         'https://sapdos-api-v2.azurewebsites.net/api/Patient/GetPatientByUId?PatientUId=addpatientUid';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to load patient data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Details'),
//         backgroundColor: AppColors.secondary,
//       ),
//       body: FutureBuilder(
//         future: _patientData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return buildPatientDetail(snapshot.data);
//           }
//         },
//       ),
//     );
//   }

//   Widget buildPatientDetail(dynamic patientData) {
//     // Extract relevant data from patientData to display in UI
//     String patientName = patientData['name'];
//     int patientAge = patientData['age'];
//     String issueDescription = patientData['issueDescription'];
//     List<dynamic> prescriptions = patientData['prescriptions'];
//     List<dynamic> reports = patientData['reports'];

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey, width: 2),
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: CircleAvatar(
//                     radius: 40.0,
//                     backgroundImage: AssetImage('assets/patients_prof.jpg'),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(patientName,
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.bold)),
//                     Text('$patientAge years', style: TextStyle(fontSize: 20)),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text('Issue description',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text(issueDescription, style: TextStyle(fontSize: 16)),
//             SizedBox(height: 16),
//             _buildSection(
//               context,
//               title: 'Patient History',
//               icon: Icons.history,
//               children: [
//                 for (var report in reports)
//                   ListTile(
//                     title: Text(report['title']),
//                     trailing: Icon(Icons.visibility, color: AppColors.primary),
//                     onTap: () {
//                       // Navigate to report details screen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => BloodReportScreen(),
//                         ),
//                       );
//                     },
//                   ),
//               ],
//             ),
//             SizedBox(height: 16),
//             _buildSection(
//               context,
//               title: 'Prescription',
//               icon: Icons.medication,
//               children: [
//                 for (var prescription in prescriptions)
//                   ListTile(
//                     title: Text(prescription['date']),
//                     trailing: Icon(Icons.visibility, color: AppColors.primary),
//                     onTap: () {
//                       // Navigate to prescription details screen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CTScanReportScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                 ListTile(
//                   leading: Icon(Icons.add, color: AppColors.primary),
//                   title: Text('Add New Prescription'),
//                   onTap: () {
//                     // Handle adding new prescription
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSection(BuildContext context,
//       {required String title,
//       required IconData icon,
//       required List<Widget> children}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       decoration: BoxDecoration(
//         color: AppColors.primary,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: ExpansionTile(
//         backgroundColor: AppColors.primary,
//         leading: Icon(icon, color: Colors.white),
//         title: Text(title, style: TextStyle(color: Colors.white)),
//         children: children.map((child) {
//           return Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
//             child: child,
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

