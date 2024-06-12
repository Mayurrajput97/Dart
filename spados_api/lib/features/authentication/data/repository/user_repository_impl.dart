import 'package:practice_work/features/authentication/data/model/user_model.dart';
import 'package:practice_work/features/authentication/domain/repository/user_repo.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<UserModel>> fetchUsers() {
    throw UnimplementedError();
  }
}
