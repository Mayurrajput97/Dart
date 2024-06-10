import 'package:flutter/material.dart';
import 'package:practice_work/features/patient/data/model/doctor_model.dart';
import 'package:practice_work/features/patient/presentation/widgets/doctor_details_page_widgets/available_slots.dart';
import 'package:practice_work/features/patient/presentation/widgets/doctor_details_page_widgets/available_slots_card.dart';
import 'package:practice_work/features/patient/presentation/widgets/doctor_details_page_widgets/book_appointment_button.dart';
import 'package:practice_work/features/patient/presentation/widgets/doctor_details_page_widgets/doctor_info.dart';
import 'payment_page.dart';

class DoctorDetailPage extends StatefulWidget {
  final Doctor doctor;

  const DoctorDetailPage({Key? key, required this.doctor}) : super(key: key);

  @override
  _DoctorDetailPageState createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  String? selectedSlot;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    final avatarRadius = isSmallScreen ? 80.0 : 100.0;
    final nameFontSize = isSmallScreen ? 20.0 : 28.0;
    final specializationFontSize = isSmallScreen ? 16.0 : 20.0;
    final descriptionFontSize = isSmallScreen ? 14.0 : 18.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DoctorInfo(
                doctor: widget.doctor,
                avatarRadius: avatarRadius,
                nameFontSize: nameFontSize,
                specializationFontSize: specializationFontSize,
                descriptionFontSize: descriptionFontSize,
              ),
              const SizedBox(height: 20),
              const AvailableSlotsCard(),
              const SizedBox(height: 10),
              AvailableSlots(
                doctor: widget.doctor,
                selectedSlot: selectedSlot,
                onSlotSelected: (slot) {
                  setState(() {
                    selectedSlot = slot;
                  });
                },
              ),
              const SizedBox(height: 20),
              BookAppointmentButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
