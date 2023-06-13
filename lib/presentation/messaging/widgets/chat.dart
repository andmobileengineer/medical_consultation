import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medical_consultation_app/domain/data/home/doctor.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/fonts.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class Chat extends StatelessWidget {
  final Doctor doctor;

  const Chat({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(doctor.profileImage),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.access_time_filled,
                              size: 15,
                              color: Random().nextBool() == true
                                  ? ApplicationColors.greenHaze
                                  : ApplicationColors.catskillWhite
                                      .withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'dr. ${doctor.name}',
                              style: TextStyles.semiBold(
                                fontSize: FontSize.s22,
                                color: ApplicationColors.black,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "10:25 AM",
                                style: TextStyles.regular(
                                  fontSize: FontSize.s15,
                                  color: ApplicationColors.tundora
                                      .withOpacity(0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Do you know where are you?",
                              style: TextStyles.regular(
                                fontSize: FontSize.s15,
                                color:
                                    ApplicationColors.tundora.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
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
