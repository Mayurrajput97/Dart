import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginTextChangedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;

  const LoginTextChangedEvent(this.emailValue, this.passwordValue);

  @override
  List<Object> get props => [emailValue, passwordValue];
}

class LoginSubmittedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;

  const LoginSubmittedEvent(this.emailValue, this.passwordValue);

  @override
  List<Object> get props => [emailValue, passwordValue];
}
