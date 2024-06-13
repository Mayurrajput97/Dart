import 'package:retrofit_api_calling/features/posts/domain/entities/post.dart';
import 'package:retrofit_api_calling/features/posts/domain/repository/post_repository.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> call() async {
    return await repository.getPosts();
  }
}
