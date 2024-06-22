import 'package:dartz/dartz.dart';
import 'package:last_demo/core/error/failures.dart';
import 'package:last_demo/core/usecases/usecase.dart';
import 'package:last_demo/features/authentication/domain/entities/user.dart';
import 'package:last_demo/features/authentication/domain/repository/user_repository.dart';

class LoginUseCase implements UseCase<User, LoginParams> {
  final UserRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
