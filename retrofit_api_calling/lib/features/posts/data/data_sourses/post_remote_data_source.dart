import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:retrofit_api_calling/features/posts/data/model/post_model.dart';

class PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSource({required this.client});

  Future<List<PostModel>> fetchPosts() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
    // --- > #17 converts each JSON object into a PostModel instance.
  }
}
