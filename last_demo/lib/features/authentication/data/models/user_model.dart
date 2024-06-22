import 'package:last_demo/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String email,
    required String password,
    required String role,
  }) : super(email: email, password: password, role: role);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
