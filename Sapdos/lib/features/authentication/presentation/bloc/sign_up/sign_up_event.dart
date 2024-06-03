// sign_up_event.dart
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpTextChangedEvent extends SignUpEvent {
  final String emailValue;
  final String passwordValue;
  final String name;

  const SignUpTextChangedEvent(this.emailValue, this.passwordValue, this.name);

  @override
  List<Object> get props => [emailValue, passwordValue, name];
}

class SignUpSubmittedEvent extends SignUpEvent {
  final String emailValue;
  final String passwordValue;
  final String nameValue;

  const SignUpSubmittedEvent(
      this.emailValue, this.passwordValue, this.nameValue);

  @override
  List<Object> get props => [emailValue, passwordValue, nameValue];
}
