import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_demo/core/utils/input_validator.dart';
import 'package:last_demo/features/authentication/domain/usecases/login_usecase.dart';
import 'package:last_demo/features/authentication/presentation/blocs/login/login_event.dart';
import 'package:last_demo/features/authentication/presentation/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitialState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (!InputValidator.isValidEmail(event.email)) {
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

      final result = await loginUseCase(
          LoginParams(email: event.email, password: event.password));

      result.fold(
        (failure) =>
            emit(LoginErrorState(errorMessage: "Invalid login credentials")),
        (user) => emit(LoginSuccessState(role: user.role)),
      );
    });
  }
}
