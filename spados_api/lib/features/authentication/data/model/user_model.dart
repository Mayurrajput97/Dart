import 'package:practice_work/features/authentication/domain/entities/user_entity.dart';

class UserModel {
  final String email;
  final String password;
  final String role;

  UserModel({required this.email, required this.password, required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }
}

// ------ New CODE : 

// import 'package:equatable/equatable.dart';

// class UserModel extends UserEnitity {
  // const UserEnitity({
  //   final String id;
  // final String name;
  // final String email;
  // final String password;
  // final String role;
  // final String? token;

  // });

//   factory UserModel.fromJson(Map<String, dynamic> map) {
//     return UserModel(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       password: json['password'],
//       role: json['role'],
//       token: json['token'],
//     );
//   
//   }
// }
