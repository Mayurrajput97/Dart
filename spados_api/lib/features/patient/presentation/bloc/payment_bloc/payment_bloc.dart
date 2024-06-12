import 'package:bloc/bloc.dart';
import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<SelectPaymentMethod>((event, emit) {
      emit(PaymentMethodSelected(paymentMethod: event.paymentMethod));
    });

    on<ProcessPayment>((event, emit) {
      emit(PaymentSuccess());
    });
  }
}
