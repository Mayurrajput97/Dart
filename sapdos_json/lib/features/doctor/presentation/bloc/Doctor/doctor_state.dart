import 'package:equatable/equatable.dart';
import 'package:practice_work/features/doctor/domain/entities/appointment.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final List<Appointment> appointments;

  const DoctorLoaded(this.appointments);

  @override
  List<Object> get props => [appointments];
}

class DoctorError extends DoctorState {
  final String message;

  const DoctorError(this.message);

  @override
  List<Object> get props => [message];
}
