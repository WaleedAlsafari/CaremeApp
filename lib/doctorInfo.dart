import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Doctor {
  String firstName;
  String lastName;
  int id;
  String specialization;

  Doctor({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.specialization,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      firstName: json['First name'],
      lastName: json['Last name'],
      id: json['id'],
      specialization: json['specialty'],
    );
  }

  static Future<List<Doctor>> fetchDoctorsFromJsonFile(String filePath) async {
    String jsonData = await rootBundle.loadString(filePath);
    List<dynamic> data = json.decode(jsonData);

    List<Doctor> doctors = data.map((json) => Doctor.fromJson(json)).toList();

    return doctors;
  }
}
