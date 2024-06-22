import 'package:dartz/dartz.dart';
import 'package:last_demo/core/error/exceptions.dart';
import 'package:last_demo/core/error/failures.dart';
import 'package:last_demo/features/authentication/data/models/user_model.dart';
import 'package:last_demo/features/authentication/data/sources/remote/user_remote_data_source.dart';
import 'package:last_demo/features/authentication/domain/entities/user.dart';
import 'package:last_demo/features/authentication/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(userModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> register(UserModel user) async {
    try {
      await remoteDataSource.register(user);
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
