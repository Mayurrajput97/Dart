import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_state.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc() : super(InitialInitialState()) {
    on<NavigateToLogin>((event, emit) {
      emit(NavigateToLoginState());
    });

    on<NavigateToSignup>((event, emit) {
      emit(NavigateToSignupState());
    });

    on<ProceedAsGuest>((event, emit) {
      emit(ProceedAsGuestState());
    });
  }
}
