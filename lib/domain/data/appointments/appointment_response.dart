import 'package:json_annotation/json_annotation.dart';
import 'package:medical_consultation_app/domain/data/appointments/appointment.dart';
import 'package:medical_consultation_app/domain/data/json_helpers.dart';

part 'appointment_response.g.dart';

@JsonSerializable()
class AppointmentResponse implements JsonHelpers {
  late List<Appointment> appointments;

  AppointmentResponse({required this.appointments});

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}
