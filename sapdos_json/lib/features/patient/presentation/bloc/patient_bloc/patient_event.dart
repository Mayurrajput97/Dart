import 'package:equatable/equatable.dart';

abstract class DoctorEvent extends Equatable {
  const DoctorEvent();

  @override
  List<Object> get props => [];
}

class FetchDoctors extends DoctorEvent {}

class DocterTileClicked extends DoctorEvent {} // --> TO - DO

class NavigationToTheDoctorDescription extends DoctorEvent {} // --> TO - DO

class DrawerItemClicked extends DoctorEvent {} // --> TO - DO
