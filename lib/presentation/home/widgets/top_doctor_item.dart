import 'package:flutter/material.dart';
import 'package:medical_consultation_app/domain/data/home/doctor.dart';
import 'package:medical_consultation_app/extensions.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/fonts.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class TopDoctorDetail extends StatelessWidget {
  final Doctor doctor;

  const TopDoctorDetail({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: InkWell(
        onTap: () {
          context.navigator.pushDoctorDetailPage(doctor);
        },
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
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(doctor.profileImage),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${doctor.speciality} Specialist',
                          style: TextStyles.regular(
                            fontSize: FontSize.s16,
                            color: ApplicationColors.catskillWhite,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'dr. ${doctor.name}',
                          style: TextStyles.semiBold(
                            fontSize: FontSize.s22,
                            color: ApplicationColors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: ApplicationColors.yellow,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              doctor.rating.toString(),
                              style: TextStyles.regular(
                                fontSize: FontSize.s15,
                                color: ApplicationColors.black,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              '•',
                              style: TextStyles.semiBold(
                                fontSize: FontSize.s16,
                                color: ApplicationColors.black,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              '${doctor.reviews} Reviews',
                              style: TextStyles.regular(
                                fontSize: FontSize.s15,
                                color: ApplicationColors.black,
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
