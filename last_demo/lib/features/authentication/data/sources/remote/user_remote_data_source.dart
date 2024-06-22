import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last_demo/core/error/exceptions.dart';
import 'package:last_demo/features/authentication/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<void> register(UserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse(
          'https://sapdos-api-v2.azurewebsites.net/api/Credentials/Login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> register(UserModel user) async {
    final response = await client.post(
      Uri.parse(
          'https://sapdos-api-v2.azurewebsites.net/api/Credentials/Register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 201) {
      throw ServerException();
    }
  }
}
