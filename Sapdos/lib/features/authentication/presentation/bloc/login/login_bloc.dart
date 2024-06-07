import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (!EmailValidator.validate(event.emailValue)) {
        emit(const LoginErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.isEmpty) {
        emit(const LoginErrorState("Please enter your password"));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginSubmittedEvent>((event, emit) async {
      emit(LoginLoadingState());
      await Future.delayed(const Duration(seconds: 4));

      if (event.emailValue == 'centra@gmail.com' &&
          event.passwordValue == 'centra') {
        emit(LoginSuccessState(role: 'doctor'));
      } else if (event.emailValue == 'mayur@gmail.com' &&
          event.passwordValue == 'mayur') {
        emit(LoginSuccessState(role: 'patient'));
      } else {
        emit(const LoginErrorState("Invalid login credentials"));
      }
    });
  }
}
