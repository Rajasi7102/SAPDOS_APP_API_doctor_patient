import 'package:doctor_and_patient_appication/utils/colors.dart';
import 'package:flutter/material.dart';

class PrescriptionPatient extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _patientNameController = TextEditingController();
  final _medicationController = TextEditingController();
  final _dosageController = TextEditingController();
  final _frequencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAPDOS Prescription Patient',
        style: TextStyle( backgroundColor: AppColors.secondary,color: Colors.white,fontSize: 25)
        
        
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Patient Name TextField
              TextFormField(
                controller: _patientNameController,
                decoration: InputDecoration(
                  labelText: 'Patient Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    
                  ), 
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter patient name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Medication TextField
              TextFormField(
                controller: _medicationController,
                decoration: InputDecoration(
                  labelText: 'Medication',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ), // Add outline border
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter medication';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Dosage TextField
              TextFormField(
                controller: _dosageController,
                decoration: InputDecoration(
                  labelText: 'Dosage',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),

                  ), // Add outline border
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter dosage';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Frequency TextField
              TextFormField(
                controller: _frequencyController,
                decoration: InputDecoration(
                  labelText: 'Frequency',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ), // Add outline border
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter frequency';
                  }
                  return null;
                },
              ),
               SizedBox(height: 20),
              // // Save Button
            
              ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      
      print('Prescription saved for ${_patientNameController.text}');

      // Show a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Prescription saved successfully!'),
          backgroundColor: AppColors.secondary,
        
          duration: Duration(seconds: 3),
        ),
      );
    }
  },
  child: Text('Save Prescription',
    style: TextStyle(backgroundColor: AppColors.secondary, color: Colors.black),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}
