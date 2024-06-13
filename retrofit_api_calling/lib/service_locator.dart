import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:retrofit_api_calling/features/posts/data/data_sourses/post_remote_data_source.dart';
import 'package:retrofit_api_calling/features/posts/data/repositories/post_repository_impl.dart';
import 'package:retrofit_api_calling/features/posts/domain/repository/post_repository.dart';
import 'package:retrofit_api_calling/features/posts/domain/usecases/get_posts.dart';
import 'package:retrofit_api_calling/features/posts/presentation/blocs/post_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => PostBloc(getPosts: sl()));

  sl.registerLazySingleton(() => GetPosts(sl()));

  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSource(client: sl()));

  sl.registerLazySingleton(() => http.Client());
}
