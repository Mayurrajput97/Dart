import 'package:equatable/equatable.dart';

class UserEnitity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final String role;
  final String? token;

  UserEnitity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.token,
  });

  @override
  List<Object?> get props {
    return [id, name, email, password, role, token];
  }

  // Factory constructor to create a User instance from JSON
  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'],
  //     name: json['name'],
  //     email: json['email'],
  //     password: json['password'],
  //     role: json['role'],
  //     token: json['token'],
  //   );
  // }

  // Method to convert a User instance to JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //     'role': role,
  //     'token': token,
  //   };
  // }
}
