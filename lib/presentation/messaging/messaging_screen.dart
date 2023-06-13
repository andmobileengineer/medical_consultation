import 'package:flutter/material.dart';
import 'package:medical_consultation_app/domain/data/home/doctor.dart';
import 'package:medical_consultation_app/presentation/messaging/widgets/chat.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/fonts.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chat',
                      style: TextStyles.semiBold(fontSize: FontSize.s28),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 40,
                        color: ApplicationColors.doveGray,
                      ),
                      iconSize: 50,
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              width: 0,
                              color: ApplicationColors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 2,
                              color: ApplicationColors.lighterGrey3,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: ApplicationColors.grey4,
                          ),
                          hintText: 'Search here ...',
                        ),
                        cursorColor: ApplicationColors.grey4,
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 53,
                      width: 53,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.edit_calendar, size: 30),
                          iconSize: 50,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: const [
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
                    Chat(
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
      ),
    );
  }
}
