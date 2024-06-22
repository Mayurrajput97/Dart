import 'package:dartz/dartz.dart';
import 'package:last_demo/core/error/failures.dart';
import 'package:last_demo/core/usecases/usecase.dart';
import 'package:last_demo/features/authentication/data/models/user_model.dart';
import 'package:last_demo/features/authentication/domain/repository/user_repository.dart';

class RegisterUseCase implements UseCase<void, RegisterParams> {
  final UserRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterParams params) async {
    return await repository.register(params.user);
  }
}

class RegisterParams {
  final UserModel user;

  RegisterParams({required this.user});
}
