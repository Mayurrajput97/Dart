import 'package:flutter/material.dart';
import 'package:practice_work/theme/colors.dart';

class AvailableSlotsCard extends StatelessWidget {
  const AvailableSlotsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: AppColors.darkblue,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.access_time, color: AppColors.white),
                SizedBox(width: 8),
                Text(
                  'Available Slots',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
