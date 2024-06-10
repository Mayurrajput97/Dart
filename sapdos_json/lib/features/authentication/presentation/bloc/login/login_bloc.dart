import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/login/login_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (!EmailValidator.validate(event.email)) {
        emit(LoginErrorState(
            errorMessage: "Please enter a valid email address"));
      } else if (event.password.isEmpty) {
        emit(LoginErrorState(errorMessage: "Please enter your password"));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginSubmittedEvent>((event, emit) async {
      emit(LoginLoadingState());
      await Future.delayed(const Duration(seconds: 4));

      if (event.email == 'centra@gmail.com' && event.password == 'centra') {
        emit(LoginSuccessState(role: 'doctor'));
      } else if (event.email == 'mayur@gmail.com' &&
          event.password == 'mayur') {
        emit(LoginSuccessState(role: 'patient'));
      } else {
        emit(LoginErrorState(errorMessage: "Invalid login credentials"));
      }
    });
  }
}
