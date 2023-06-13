// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as int,
      date: json['date'] as String,
      time: json['time'] as String,
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'doctor': instance.doctor,
    };
