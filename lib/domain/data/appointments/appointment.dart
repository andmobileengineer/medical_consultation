import 'package:json_annotation/json_annotation.dart';
import 'package:medical_consultation_app/domain/data/home/doctor.dart';
import 'package:medical_consultation_app/domain/data/json_helpers.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment implements JsonHelpers {
  final int id;
  final String date;
  final String time;
  final Doctor doctor;

  Appointment({
    required this.id,
    required this.date,
    required this.time,
    required this.doctor,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
