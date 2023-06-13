import 'package:medical_consultation_app/domain/data/appointments/appointment_response.dart';

abstract class UserSessionCache {
  void setAppointments(AppointmentResponse response);

  AppointmentResponse? getAppointments();
}

class UserSessionCacheImpl extends UserSessionCache {
  final String _kAppointmentsKey = "PROMOS_ID_K";

  final Map<String, dynamic> _userSessionCache = {};

  @override
  void setAppointments(AppointmentResponse response) {
    _userSessionCache[_kAppointmentsKey] = response;
  }

  @override
  AppointmentResponse? getAppointments() {
    return _userSessionCache[_kAppointmentsKey];
  }
}