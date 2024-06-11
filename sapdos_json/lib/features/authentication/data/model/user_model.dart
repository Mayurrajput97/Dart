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
