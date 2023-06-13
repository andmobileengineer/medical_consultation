import 'package:json_annotation/json_annotation.dart';
import 'package:medical_consultation_app/domain/data/json_helpers.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor implements JsonHelpers{
  final String name;
  final String profileImage;
  final String speciality;
  final int patients;
  final int experienceInYears;
  final double rating;
  final String about;
  final int reviews;

  const Doctor(
    this.name,
    this.profileImage,
    this.speciality,
    this.patients,
    this.experienceInYears,
    this.rating,
    this.about,
    this.reviews,
  );

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
