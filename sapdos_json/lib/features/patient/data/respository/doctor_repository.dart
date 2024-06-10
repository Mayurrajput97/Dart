import 'package:flutter/services.dart';
import 'package:practice_work/features/patient/data/model/doctor_model.dart';

class DoctorRepository {
  Future<List<Doctor>> fetchDoctors() async {
    try {
      final response = await rootBundle.loadString('assets/json/doctors.json');
      return Doctor.fromJsonList(response);
    } catch (e) {
      throw Exception('Failed to load doctors: $e');
    }
  }
}
