import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupErrorState extends SignupState {
  final String errorMessage;

  SignupErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class SignupValidState extends SignupState {}
