import 'package:flutter/material.dart';
import 'package:medical_consultation_app/domain/data/home/doctor.dart';
import 'package:medical_consultation_app/presentation/home/pages/widgets/date_selection.dart';
import 'package:medical_consultation_app/presentation/home/pages/widgets/doctor_detail.dart';
import 'package:medical_consultation_app/presentation/home/pages/widgets/time_selection.dart';
import 'package:medical_consultation_app/resources/colors.dart';

import 'widgets/transparent_app_bar.dart';

class DoctorDetailPage extends StatefulWidget {
  final Doctor doctor;

  const DoctorDetailPage({super.key, required this.doctor});

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      appBar: const TransparentAppBar(),
      body: Stack(
        children: [
          Positioned.fill(
            top: 180,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: ApplicationColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorDetail(doctor: widget.doctor),
                    const DateSelection(),
                    const SizedBox(height: 15),
                    const TimeSelection(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 148,
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.doctor.profileImage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}