import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import '../../../models/doctor.dart';


class DoctorProvider with ChangeNotifier {
  List<Doctor> _doctors = [];

  List<Doctor> get doctors => _doctors;

  DoctorProvider() {
    _loadDoctors();
  }

  Future<void> _loadDoctors() async {
    final doctorsData = await _loadJsonFile('assets/doctors.json');
    _doctors = doctorsData.map<Doctor>((doctor) {
      return Doctor(
        name: doctor['name'],
        specialization: doctor['specialization'],
        rating: doctor['rating'].toDouble(),
        imageUrl: doctor['imageUrl'],
        description: doctor['description'],
        experience: doctor['experience'],
        education: doctor['education'],
      );
    }).toList();
    notifyListeners();
  }

  Future<List<dynamic>> _loadJsonFile(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final dynamic jsonMap = jsonDecode(jsonString);
    return jsonMap['doctors'];
  }
}
