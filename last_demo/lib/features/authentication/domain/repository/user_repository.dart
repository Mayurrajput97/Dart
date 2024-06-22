import 'package:dartz/dartz.dart';
import 'package:last_demo/core/error/failures.dart';
import 'package:last_demo/features/authentication/data/models/user_model.dart';
import 'package:last_demo/features/authentication/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, void>> register(UserModel user);
}
