

class Appointment {
  final String time;
  final String patientName;
  final int patientAge;
  final String status;

  Appointment({
    required this.time,
    required this.patientName,
    required this.patientAge,
    required this.status,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      time: json['time'],
      patientName: json['patientName'],
      patientAge: json['patientAge'],
      status: json['status'],
    );
  }
}
