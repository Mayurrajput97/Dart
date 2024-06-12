import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/user_model.dart';

class UserRepository {
  Future<List<UserModel>> fetchUsers() async {
    final String response =
        await rootBundle.loadString('assets/json/users.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => UserModel.fromJson(json)).toList();
  }
}
