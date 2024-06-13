import 'package:retrofit_api_calling/features/posts/data/data_sourses/post_remote_data_source.dart';
import 'package:retrofit_api_calling/features/posts/data/model/post_model.dart';
import 'package:retrofit_api_calling/features/posts/domain/entities/post.dart';
import 'package:retrofit_api_calling/features/posts/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getPosts() async {
    final List<PostModel> postModels = await remoteDataSource.fetchPosts();
    return postModels
        .map((postModel) => Post(
            id: postModel.id, title: postModel.title, body: postModel.body))
        .toList();
  }
}
