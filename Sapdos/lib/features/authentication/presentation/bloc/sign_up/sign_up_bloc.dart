// sign_up_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpTextChangedEvent>((event, emit) {
      if (!EmailValidator.validate(event.emailValue)) {
        emit(const SignUpErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.isEmpty) {
        emit(const SignUpErrorState("Please enter your password"));
      } else if (event.passwordValue.length < 6) {
        emit(const SignUpErrorState("Password must be at least 6 characters"));
      } else if (event.name.isEmpty) {
        emit(const SignUpErrorState("Please enter your name"));
      } else {
        emit(SignUpValidState());
      }
    });

    on<SignUpSubmittedEvent>((event, emit) async {
      emit(SignUpLoadingState());
      await Future.delayed(const Duration(seconds: 4));

      if (EmailValidator.validate(event.emailValue) &&
          event.passwordValue.length >= 6 &&
          event.nameValue.isNotEmpty) {
        emit(SignUpSuccessState());
      } else {
        emit(const SignUpErrorState("Invalid sign-up credentials"));
      }
    });
  }
}
