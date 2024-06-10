import 'package:flutter/material.dart';
import 'package:practice_work/features/patient/data/model/doctor_model.dart';

class AvailableSlots extends StatelessWidget {
  final Doctor doctor;
  final String? selectedSlot;
  final Function(String?) onSlotSelected;

  const AvailableSlots({
    Key? key,
    required this.doctor,
    required this.selectedSlot,
    required this.onSlotSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: doctor.availableSlots.map((slot) {
        return ChoiceChip(
          label: Text(slot),
          selected: selectedSlot == slot,
          onSelected: (selected) {
            onSlotSelected(selected ? slot : null);
          },
        );
      }).toList(),
    );
  }
}
