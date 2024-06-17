import 'package:flutter/material.dart';

class BookAppointmentButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BookAppointmentButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          'Book Appointment',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF13235a),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(150, 50),
        ),
      ),
    );
  }
}
