import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/patient/data/respository/doctor_repository.dart';
import 'package:practice_work/features/patient/presentation/bloc/patient_bloc/patient_event.dart';
import 'package:practice_work/features/patient/presentation/bloc/patient_bloc/patient_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository doctorRepository;

  DoctorBloc(this.doctorRepository) : super(DoctorInitial()) {
    on<FetchDoctors>((event, emit) async {
      emit(DoctorLoading());
      try {
        final doctors = await doctorRepository.fetchDoctors();
        emit(DoctorLoaded(doctors));
      } catch (e) {
        emit(DoctorError(e.toString()));
      }
    });
  }
}
