import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class SelectPaymentMethod extends PaymentEvent {
  final String paymentMethod;

  const SelectPaymentMethod(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}

class ProcessPayment extends PaymentEvent {
  const ProcessPayment();

  @override
  List<Object> get props => [];
}
