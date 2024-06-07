import 'package:equatable/equatable.dart';
import 'package:practice_work/features/patient/data/model/doctor_model.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final List<Doctor> doctors;

  const DoctorLoaded(this.doctors);

  @override
  List<Object> get props => [doctors];
}

class DoctorError extends DoctorState {
  final String message;

  const DoctorError(this.message);

  @override
  List<Object> get props => [message];
}
