import 'package:equatable/equatable.dart';

abstract class InitialState extends Equatable {
  const InitialState();

  @override
  List<Object> get props => [];
}

class InitialInitial extends InitialState {}

class NavigateToLoginState extends InitialState {}

class NavigateToSignupState extends InitialState {}

class ProceedAsGuestState extends InitialState {}
