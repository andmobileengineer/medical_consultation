import 'package:bloc/bloc.dart';
import 'package:medical_consultation_app/domain/api/network_bound_resource.dart';
import 'package:medical_consultation_app/domain/api/network_bount_state.dart';
import 'package:medical_consultation_app/repositories/appointments/appointment_repository.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<NetworkBoundState> {
  final AppointmentRepository repository;

  AppointmentsCubit({required this.repository})
      : super(NetworkBoundResourceState(Resource.initial()));

  void fetchAppointments() {
    repository.getAppointments().listen((resource) {
      emit(NetworkBoundResourceState(resource));
    });
  }
}