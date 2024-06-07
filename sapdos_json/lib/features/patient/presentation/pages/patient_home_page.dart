import 'package:flutter/material.dart';
import 'package:practice_work/features/doctor/presentation/widgets/custom_drawer.dart';
import 'package:practice_work/features/patient/data/model/doctor_model.dart';
import 'package:practice_work/features/patient/data/respository/doctor_repository.dart';
import 'package:practice_work/features/patient/presentation/widgets/doctor_tile.dart';
import 'package:practice_work/theme/colors.dart';

class PatientPage extends StatefulWidget {
  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  late Future<List<Doctor>> _futureDoctors;

  @override
  void initState() {
    super.initState();
    _futureDoctors = DoctorRepository().fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: 130,
        title: const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Text(
                'Mayur',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 60.0, top: 15.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/doctors.png"),
              radius: 60,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Card(
              color: AppColors.darkblue,
              elevation: 8,
              child: SizedBox(
                height: 45,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Doctors List',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                      Icon(
                        Icons.list,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Doctor>>(
                future: _futureDoctors,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No doctors found'));
                  } else {
                    final doctors = snapshot.data!;
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 1.2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        return DoctorTile(doctor: doctors[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
