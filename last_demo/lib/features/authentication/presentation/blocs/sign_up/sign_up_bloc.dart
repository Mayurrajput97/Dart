import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_demo/core/utils/input_validator.dart';
import 'package:last_demo/features/authentication/domain/usecases/register_usecase.dart';
import 'package:last_demo/features/authentication/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:last_demo/features/authentication/presentation/blocs/sign_up/sign_up_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final RegisterUseCase registerUseCase;

  SignupBloc({required this.registerUseCase}) : super(SignupInitialState()) {
    on<SignupTextChangedEvent>((event, emit) {
      if (!InputValidator.isValidEmail(event.email)) {
        emit(SignupErrorState(
            errorMessage: "Please enter a valid email address"));
      } else if (event.password.isEmpty ||
          event.password != event.confirmPassword) {
        emit(SignupErrorState(errorMessage: "Passwords do not match"));
      } else {
        emit(SignupValidState());
      }
    });

    on<SignupSubmittedEvent>((event, emit) async {
      emit(SignupLoadingState());

      final result = await registerUseCase(RegisterParams(user: event.user));

      result.fold(
        (failure) =>
            emit(SignupErrorState(errorMessage: "Registration failed")),
        (_) => emit(SignupSuccessState()),
      );
    });
  }
}
