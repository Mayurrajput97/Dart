import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/widgets_comman/custom_drawer.dart';
import 'package:practice_work/features/patient/data/respository/doctor_repository.dart';
import 'package:practice_work/features/patient/presentation/bloc/patient_bloc/patient_bloc.dart';
import 'package:practice_work/features/patient/presentation/bloc/patient_bloc/patient_event.dart';
import 'package:practice_work/features/patient/presentation/bloc/patient_bloc/patient_state.dart';
import 'package:practice_work/features/patient/presentation/widgets/doctor_tile.dart';
import 'package:practice_work/theme/colors.dart';

class PatientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth < 400 ? 30 : 40;
    double subtitleFontSize = screenWidth < 400 ? 20 : 28;
    double avatarRadius = screenWidth < 400 ? 40 : 60;

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: screenWidth < 400 ? 100 : 130,
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                ),
              ),
              Text(
                'Mayur',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: subtitleFontSize),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0, top: 15.0),
            child: CircleAvatar(
              backgroundImage: const AssetImage("assets/images/doctors.png"),
              radius: avatarRadius,
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

                      double childAspectRatio = 4.7;
                      double crossAxisSpacing = 30;
                      double mainAxisSpacing = 20;

                      if (screenWidth < 400) {
                        childAspectRatio = 1.8;
                        crossAxisSpacing = 5;
                        mainAxisSpacing = 5;
                      } else if (screenWidth < 600) {
                        childAspectRatio = 2.1;
                        crossAxisSpacing = 10;
                        mainAxisSpacing = 10;
                      } else if (screenWidth < 900) {
                        childAspectRatio = 2.2;
                        crossAxisSpacing = 15;
                        mainAxisSpacing = 15;
                      }

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: childAspectRatio,
                          crossAxisSpacing: crossAxisSpacing,
                          mainAxisSpacing: mainAxisSpacing,
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
