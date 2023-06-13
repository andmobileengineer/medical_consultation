import 'package:dio/dio.dart';
import 'package:medical_consultation_app/constants/api_endpoints.dart';
import 'package:medical_consultation_app/domain/data/appointments/appointment_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi()
abstract class APIManager {
  factory APIManager(Dio dio, {String baseUrl}) = _APIManager;

  @GET(ApiEndpoints.appointments)
  Future<AppointmentResponse> appointments();
}