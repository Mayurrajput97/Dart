import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String role;

  LoginSuccessState({required this.role});

  @override
  List<Object?> get props => [role];
}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class LoginValidState extends LoginState {}
