import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginTextChangedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginTextChangedEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmittedEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
