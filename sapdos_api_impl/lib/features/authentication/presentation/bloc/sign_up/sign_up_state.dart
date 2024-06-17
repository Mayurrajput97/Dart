import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String errorMessage;

  SignUpErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
