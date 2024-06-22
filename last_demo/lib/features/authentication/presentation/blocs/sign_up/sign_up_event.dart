import 'package:equatable/equatable.dart';
import 'package:last_demo/features/authentication/data/models/user_model.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupTextChangedEvent extends SignupEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignupTextChangedEvent(this.email, this.password, this.confirmPassword);

  @override
  List<Object?> get props => [email, password, confirmPassword];
}

class SignupSubmittedEvent extends SignupEvent {
  final UserModel user;

  SignupSubmittedEvent(this.user);

  @override
  List<Object?> get props => [user];
}
