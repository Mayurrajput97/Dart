import 'package:equatable/equatable.dart';

abstract class InitialState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialInitialState extends InitialState {}

class NavigateToLoginState extends InitialState {}

class NavigateToSignupState extends InitialState {}

class ProceedAsGuestState extends InitialState {}
