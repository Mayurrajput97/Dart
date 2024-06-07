import 'package:flutter/material.dart';
import 'package:practice_work/features/doctor/presentation/pages/patient_desc_page.dart';

class AppointmentTile extends StatelessWidget {
  final String time;
  final String patientName;
  final int age;
  final String status;

  const AppointmentTile({
    Key? key,
    required this.time,
    required this.patientName,
    required this.age,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PatientDescriptionPage(
              patientName: patientName,
              age: age,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: const Icon(Icons.watch_later, color: Color(0xFF13235a)),
              ),
              const SizedBox(width: 8),
              Container(
                width: 100,
                height: 50,
                color: const Color(0xFFDCE0ED),
                child: Center(
                  child: Text(
                    time,
                    style: const TextStyle(
                      color: Color(0xFF13235a),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 50,
                  color: const Color(0xffFFFFFF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          patientName,
                          style: const TextStyle(
                            color: Color(0xFF13235a),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Age $age',
                          style: const TextStyle(color: Color(0xFF13235a)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
