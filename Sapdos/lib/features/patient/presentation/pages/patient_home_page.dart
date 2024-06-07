import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/doctor/presentation/widgets/custom_drawer.dart';
import 'package:practice_work/features/patient/data/respository/doctor_repository.dart';
import 'package:practice_work/features/patient/presentation/bloc/doctor_bloc.dart';
import 'package:practice_work/features/patient/presentation/bloc/doctor_event.dart';
import 'package:practice_work/features/patient/presentation/bloc/doctor_state.dart';
import 'package:practice_work/features/patient/presentation/widgets/doctor_tile.dart';
import 'package:practice_work/theme/colors.dart';

class PatientPage extends StatelessWidget {
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
      body: BlocProvider(
        create: (context) {
          final bloc = DoctorBloc(DoctorRepository());
          bloc.add(FetchDoctors());
          return bloc;
        },
        child: Padding(
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
                child: BlocBuilder<DoctorBloc, DoctorState>(
                  builder: (context, state) {
                    if (state is DoctorLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is DoctorError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else if (state is DoctorLoaded) {
                      final doctors = state.doctors;
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
                    return const Center(child: Text('No doctors found'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
