import 'package:flutter/material.dart';
import 'package:medical_consultation_app/domain/data/home/doctor.dart';
import 'package:medical_consultation_app/presentation/home/pages/doctor_detail_page.dart';

extension BuildContextExtensions on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}

extension NavigatorStatextensions on NavigatorState {
  void navigate(Widget screen) {
    context.navigator.push(MaterialPageRoute(builder: (context) => screen));
  }

  void pushDoctorDetailPage(Doctor doctor) {
    context.navigator.navigate(DoctorDetailPage(doctor: doctor));
  }
}
