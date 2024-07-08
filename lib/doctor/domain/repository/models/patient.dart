class Patient {
  final String name;
  final int age;
  final String description;
  

  Patient({
    required this.name,
    required this.age,
    required this.description,
  
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      name: json['name'],
      age: json['age'],
      description: json['description'],
    
    );
  }


 }

