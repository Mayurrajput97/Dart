import 'package:equatable/equatable.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentMethodSelected extends PaymentState {
  final String paymentMethod;

  const PaymentMethodSelected({required this.paymentMethod});

  @override
  List<Object> get props => [paymentMethod];
}

class PaymentSuccess extends PaymentState {}
