import 'package:flutter/material.dart';
import 'package:practice_work/theme/colors.dart';

class AppointmentSummaryCard extends StatelessWidget {
  final String label;
  final String count;
  final double percentage;

  const AppointmentSummaryCard({
    Key? key,
    required this.label,
    required this.count,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.faintblue,
      elevation: 4,
      child: SizedBox(
        height: 160,
        width: 140,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(
                      value: percentage,
                      backgroundColor: Colors.grey[300],
                      color: AppColors.white,
                      strokeWidth: 6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      count,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
