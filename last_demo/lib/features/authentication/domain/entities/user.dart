import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;
  final String role;

  const User({
    required this.email,
    required this.password,
    required this.role,
  });

  @override
  List<Object?> get props => [email, password, role];
}
