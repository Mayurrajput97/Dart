import 'package:flutter/material.dart';
import 'package:practice_work/features/doctor/presentation/widgets/appointment_card.dart';
import 'package:practice_work/features/doctor/presentation/widgets/appointment_tiles.dart';
import 'package:practice_work/features/widgets_comman/custom_drawer.dart';
import 'package:practice_work/theme/colors.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({Key? key}) : super(key: key);

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
                'Dr. Rahul',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                "Today's Appointments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isLargeScreen = constraints.maxWidth > 600;
                  return Row(
                    children: [
                      const AppointmentSummaryCard(
                        label: 'Pending Appointments',
                        count: '19/40',
                        percentage: 19 / 40,
                      ),
                      SizedBox(width: isLargeScreen ? 20 : 16),
                      const AppointmentSummaryCard(
                        label: 'Completed Appointments',
                        count: '21/40',
                        percentage: 21 / 40,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
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
                        'Wednesday, March 7',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                      Icon(
                        Icons.calendar_month_sharp,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  AppointmentTile(
                    time: '10:00 AM',
                    patientName: 'Mayur',
                    age: 30,
                    status: 'pending',
                  ),
                  AppointmentTile(
                    time: '10:15 AM',
                    patientName: 'Pavan ',
                    age: 25,
                    status: 'completed',
                  ),
                  AppointmentTile(
                    time: '10:30 AM',
                    patientName: 'Vidya C',
                    age: 40,
                    status: 'pending',
                  ),
                  AppointmentTile(
                    time: '10:45 AM',
                    patientName: 'Person D',
                    age: 35,
                    status: 'completed',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
