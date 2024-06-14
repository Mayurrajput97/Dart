import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}

// ---->  Concrete implementations of this interface is post_repository_impl
