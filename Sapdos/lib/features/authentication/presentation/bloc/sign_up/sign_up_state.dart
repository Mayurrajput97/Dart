// sign_up_state.dart
import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpValidState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String errorMessage;

  const SignUpErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SignUpSuccessState extends SignUpState {}
