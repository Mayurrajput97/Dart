import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;

  const LoginErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoginSuccessState extends LoginState {
  final String role;

  const LoginSuccessState({required this.role});

  @override
  List<Object> get props => [role];
}
