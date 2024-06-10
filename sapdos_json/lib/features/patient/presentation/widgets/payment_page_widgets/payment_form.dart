import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/payment_bloc/payment_bloc.dart';
import '../../bloc/payment_bloc/payment_event.dart';

class PaymentForm extends StatelessWidget {
  final String paymentMethod;

  const PaymentForm({Key? key, required this.paymentMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (paymentMethod == 'Card') ...[
          const Text(
            'Enter your card details below',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 14),
          _buildTextField(context, 'Card Number'),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _buildTextField(context, 'Card Holder')),
              const SizedBox(width: 14),
              Expanded(child: _buildTextField(context, 'MM/YY')),
              const SizedBox(width: 14),
              Expanded(child: _buildTextField(context, 'CVV')),
            ],
          ),
        ],
        const SizedBox(height: 25),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              context.read<PaymentBloc>().add(const ProcessPayment());
            },
            icon: const Icon(
              Icons.payment,
              color: Colors.white,
            ),
            label: const Text(
              'Pay Now',
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
        ),
      ],
    );
  }

  Widget _buildTextField(BuildContext context, String label) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        labelText: label,
      ),
    );
  }
}
