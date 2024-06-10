import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/widgets/header_section.dart';
import 'package:practice_work/features/widgets_comman/left_image_section.dart';
import '../bloc/payment_bloc/payment_bloc.dart';
import '../bloc/payment_bloc/payment_event.dart';
import '../bloc/payment_bloc/payment_state.dart';
import '../widgets/payment_page_widgets/payment_form.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state is PaymentSuccess) {
            _showPaymentSuccessDialog(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Row(
              children: [
                const LeftImageSection(
                    imagePath: 'assets/images/login_page.jpg'),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const HeaderSection(
                            title: 'SAPDOS',
                            subtitle: 'Booking Appointment',
                            description: '',
                          ),
                          const SizedBox(height: 25),
                          _buildPaymentForm(context, state),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentForm(BuildContext context, PaymentState state) {
    return Center(
      child: Container(
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPaymentDropdown(context, state),
            const SizedBox(height: 28),
            if (state is PaymentMethodSelected)
              PaymentForm(paymentMethod: state.paymentMethod),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDropdown(BuildContext context, PaymentState state) {
    String selectedMethod = 'Select';
    if (state is PaymentMethodSelected) {
      selectedMethod = state.paymentMethod;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Method',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedMethod == 'Select' ? null : selectedMethod,
              hint: const Text('Select'),
              items: const [
                DropdownMenuItem(
                    value: 'Net Banking', child: Text('Net Banking')),
                DropdownMenuItem(value: 'Card', child: Text('Card')),
                DropdownMenuItem(value: 'UPI', child: Text('UPI')),
              ],
              onChanged: (value) {
                if (value != null) {
                  context.read<PaymentBloc>().add(SelectPaymentMethod(value));
                }
              },
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Select the mode of payment you prefer',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: 300,
            height: 250,
            decoration: BoxDecoration(
              color: const Color(0xFF13235a),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 80,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Your booking is confirmed',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 22),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Okay',
                    style: TextStyle(
                      color: Color(0xFF13235a),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
