import 'package:flutter/services.dart';
import 'package:practice_work/features/patient/data/model/doctor_model.dart';

class DoctorRepository {
  Future<List<Doctor>> fetchDoctors() async {
    final response = await rootBundle.loadString('assets/json/doctors.json');
    return Doctor.fromJsonList(response);
  }
}
