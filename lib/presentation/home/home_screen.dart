import 'package:flutter/material.dart';
import 'package:medical_consultation_app/domain/data/home/doctor.dart';
import 'package:medical_consultation_app/presentation/home/widgets/header.dart';
import 'package:medical_consultation_app/presentation/home/widgets/quick_links.dart';
import 'package:medical_consultation_app/presentation/home/widgets/search.dart';
import 'package:medical_consultation_app/presentation/home/widgets/todays_appointments_list.dart';
import 'package:medical_consultation_app/presentation/home/widgets/top_doctor_item.dart';
import 'package:medical_consultation_app/presentation/home/widgets/user_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const UserName(),
              const SizedBox(height: 10),
              const Search(),
              const SizedBox(height: 12),
              const QuickLinks(),
              const Header(
                title: 'Appointment Today',
                moreButtonText: 'See All',
              ),
              const TodayAppointmentsList(),
              const Header(
                title: 'Top Doctor\'s for you',
                moreButtonText: 'See All',
              ),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: const [
                  TopDoctorDetail(
                    doctor: Doctor(
                      "Sourabh",
                      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
                      "Heart",
                      1000,
                      10,
                      4.5,
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      123,
                    ),
                  ),
                  TopDoctorDetail(
                    doctor: Doctor(
                      "Anil",
                      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
                      "Liver",
                      1000,
                      10,
                      4.5,
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      124,
                    ),
                  ),
                  TopDoctorDetail(
                    doctor: Doctor(
                      "Abhishek",
                      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
                      "Kidney",
                      1000,
                      10,
                      4.5,
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      29,
                    ),
                  ),
                  TopDoctorDetail(
                    doctor: Doctor(
                      "Varun",
                      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
                      "Neuro",
                      1000,
                      10,
                      4.5,
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      34,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
