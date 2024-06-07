import 'package:bloc/bloc.dart';
import 'package:practice_work/features/doctor/domain/entities/appointment.dart';
import 'package:practice_work/features/doctor/presentation/bloc/doctor_event.dart';
import 'package:practice_work/features/doctor/presentation/bloc/doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(DoctorInitial()) {
    on<LoadAppointments>((event, emit) async {
      emit(DoctorLoading());
      try {
        final appointments = [
          Appointment(
              time: '10:00 AM',
              patientName: 'Mayur',
              age: 30,
              status: 'pending'),
          Appointment(
              time: '10:15 AM',
              patientName: 'mayur ',
              age: 25,
              status: 'completed'),
        ];
        emit(DoctorLoaded(appointments));
      } catch (e) {
        emit(const DoctorError('Failed to load appointments'));
      }
    });
  }
}
