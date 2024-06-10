import 'package:flutter/material.dart';
import 'package:practice_work/features/patient/data/model/doctor_model.dart';
import 'package:practice_work/theme/colors.dart';

class DoctorInfo extends StatelessWidget {
  final Doctor doctor;
  final double avatarRadius;
  final double nameFontSize;
  final double specializationFontSize;
  final double descriptionFontSize;

  const DoctorInfo({
    Key? key,
    required this.doctor,
    required this.avatarRadius,
    required this.nameFontSize,
    required this.specializationFontSize,
    required this.descriptionFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildDoctorAvatar(),
        const SizedBox(width: 16),
        _buildDoctorDetails(),
      ],
    );
  }

  Widget _buildDoctorAvatar() {
    return Container(
      width: avatarRadius * 2 + 16,
      height: avatarRadius * 2 + 16,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          doctor.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDoctorDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDoctorDetailRow(
              Icons.person, doctor.name, nameFontSize, FontWeight.bold),
          const SizedBox(height: 8),
          _buildDoctorDetailRow(Icons.work, doctor.specialization,
              specializationFontSize, FontWeight.normal),
          const SizedBox(height: 8),
          _buildDoctorDetailRow(Icons.school, doctor.education.join(", "),
              specializationFontSize, FontWeight.normal),
          const SizedBox(height: 8),
          Text(
            doctor.description,
            style: TextStyle(fontSize: descriptionFontSize),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorDetailRow(
      IconData icon, String text, double fontSize, FontWeight fontWeight) {
    return Row(
      children: [
        Icon(icon, color: AppColors.darkblue),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ],
    );
  }
}
