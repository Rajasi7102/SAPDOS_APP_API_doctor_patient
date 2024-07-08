import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../repository/models/patient.dart';

class AppointmentProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  List<Patient> _patients = [];

  DateTime get selectedDate => _selectedDate;
  List<Patient> get patients => _patients;

  AppointmentProvider() {
    _loadPatientData();
  }

  void _loadPatientData() async {
    final String jsonString =
        await rootBundle.loadString('assets/patients.json');
    final List<dynamic> jsonResponse = jsonDecode(jsonString);
    _patients = jsonResponse.map((e) => Patient.fromJson(e)).toList();
    notifyListeners();
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}
// appointment_provider.dart

// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../models/data_model.dart';

// class AppointmentProvider with ChangeNotifier {
//   List<Appointment> _appointments = [];

//   List<Appointment> get appointments => _appointments;

//   Future<void> fetchAppointments() async {
//     final url = Uri.parse('https://sapdos-api-v2.azurewebsites.net/api/Doctor/GetDoctorDashboard');

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         _appointments = data.map((json) => Appointment.fromJson(json)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load appointments');
//       }
//     } catch (error) {
//       throw Exception('Error: $error');
//     }
//   }

//   // Other provider methods as per your implementation
// }
