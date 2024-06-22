import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/authentication/data/repository/user_repository_impl.dart';
import 'features/authentication/data/sources/remote/user_remote_data_source.dart';
import 'features/authentication/domain/repository/user_repository.dart';
import 'features/authentication/domain/usecases/login_usecase.dart';
import 'features/authentication/domain/usecases/register_usecase.dart';
import 'features/authentication/presentation/blocs/login/login_bloc.dart';
import 'features/authentication/presentation/blocs/sign_up/sign_up_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory(() => SignupBloc(registerUseCase: sl()));

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton(() => http.Client());
}
