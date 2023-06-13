
import 'package:medical_consultation_app/domain/api/network_bound_resource.dart';
import 'package:medical_consultation_app/domain/data/appointments/appointment.dart';
import 'package:medical_consultation_app/domain/data/appointments/appointment_response.dart';
import 'package:medical_consultation_app/repositories/base_repository.dart';

abstract class AppointmentRepository extends BaseRepository {
  Stream<Resource<List<Appointment>>> getAppointments({bool refresh});
}

class AppointmentRepositoryImpl extends AppointmentRepository {
  @override
  Stream<Resource<List<Appointment>>> getAppointments({bool refresh = true}) {
    return NetworkBoundResource<List<Appointment>, AppointmentResponse>(
      saveCallResult: (promotionResponse) {
        userSessionCache.setAppointments(promotionResponse);
        return promotionResponse.appointments;
      },
      loadFromDb: () {
        AppointmentResponse? response = userSessionCache.getAppointments();
        return response?.appointments;
      },
      shouldFetch: (promos) => promos == null || refresh == true,
      createCall: () {
        return apiManager.appointments();
      },
    ).load();
  }
}