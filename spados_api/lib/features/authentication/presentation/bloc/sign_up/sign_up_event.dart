import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpTextChangedEvent extends SignUpEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignUpTextChangedEvent(this.email, this.password, this.confirmPassword);

  @override
  List<Object?> get props => [email, password, confirmPassword];
}

class SignUpSubmittedEvent extends SignUpEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignUpSubmittedEvent(this.email, this.password, this.confirmPassword);

  @override
  List<Object?> get props => [email, password, confirmPassword];
}
