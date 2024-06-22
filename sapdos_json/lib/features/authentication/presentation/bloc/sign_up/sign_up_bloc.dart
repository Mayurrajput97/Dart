import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    // Event handler for email, password
    on<SignUpTextChangedEvent>((event, emit) {
      if (!EmailValidator.validate(event.email)) {
        emit(SignUpErrorState(
            errorMessage: "Please enter a valid email address"));
      } else if (event.password.isEmpty) {
        emit(SignUpErrorState(errorMessage: "Please enter your password"));
      } else if (event.password.length < 6) {
        emit(SignUpErrorState(
            errorMessage: "Password must be at least 6 characters"));
      } else if (event.confirmPassword.isEmpty) {
        emit(SignUpErrorState(errorMessage: "Please confirm your password"));
      } else if (event.password != event.confirmPassword) {
        emit(SignUpErrorState(errorMessage: "Passwords do not match"));
      }
    });

    // Event handler for submission of sign-up credentials.
    on<SignUpSubmittedEvent>((event, emit) async {
      emit(SignUpLoadingState());
      await Future.delayed(const Duration(seconds: 4));

      if (EmailValidator.validate(event.email) &&
          event.password.length >= 6 &&
          event.password == event.confirmPassword) {
        emit(SignUpSuccessState());
      } else {
        emit(SignUpErrorState(errorMessage: "Invalid sign-up credentials"));
      }
    });
  }
}
