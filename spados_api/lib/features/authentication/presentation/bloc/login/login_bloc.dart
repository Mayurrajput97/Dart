import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/login/login_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/login/login_state.dart';
import 'package:practice_work/features/authentication/domain/repository/user_repo.dart';

import '../../../data/model/user_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitialState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (!EmailValidator.validate(event.email)) {
        emit(LoginErrorState(
            errorMessage: "Please enter a valid email address"));
      } else if (event.password.isEmpty) {
        emit(LoginErrorState(errorMessage: "Please enter your password"));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginSubmittedEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
        final users = await userRepository.fetchUsers();
        final user = users.firstWhere(
          (user) =>
              user.email == event.email && user.password == event.password,
          orElse: () => UserModel(email: '', password: '', role: ''),
        );

        if (user.email.isNotEmpty) {
          emit(LoginSuccessState(role: user.role));
        } else {
          emit(LoginErrorState(errorMessage: "Invalid login credentials"));
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: "Failed to fetch user data"));
      }
    });
  }
}
