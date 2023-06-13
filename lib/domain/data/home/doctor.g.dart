// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      json['name'] as String,
      json['profileImage'] as String,
      json['speciality'] as String,
      json['patients'] as int,
      json['experienceInYears'] as int,
      (json['rating'] as num).toDouble(),
      json['about'] as String,
      json['reviews'] as int,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'name': instance.name,
      'profileImage': instance.profileImage,
      'speciality': instance.speciality,
      'patients': instance.patients,
      'experienceInYears': instance.experienceInYears,
      'rating': instance.rating,
      'about': instance.about,
      'reviews': instance.reviews,
    };
