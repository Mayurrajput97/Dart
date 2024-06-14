import 'package:retrofit_api_calling/features/posts/domain/entities/post.dart';
import 'package:retrofit_api_calling/features/posts/domain/repository/post_repository.dart';

// ----> Bridge between [Bloc <----> Repository ]

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);
// ---> Bloc will invoke the call method to get the posts.

  Future<List<Post>> call() async {
    return await repository.getPosts();
  }
}

//  # 13 ---> the method will pause here and wait for the getPosts method of the repository to complete.