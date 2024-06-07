import 'package:bloc/bloc.dart';
import 'initial_event.dart';
import 'initial_state.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc() : super(InitialInitial()) {
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
