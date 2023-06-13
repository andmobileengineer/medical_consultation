import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medical_consultation_app/domain/data/home/doctor.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/fonts.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class DoctorDetail extends StatefulWidget {
  final Doctor doctor;

  const DoctorDetail({super.key, required this.doctor});

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  final String Function(Match) mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 65),
        Center(
          child: Text(
            'dr. ${widget.doctor.name}',
            style: TextStyles.semiBold(
              fontSize: 25,
              color: ApplicationColors.black,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            '${widget.doctor.speciality} Specialist',
            style: TextStyles.semiBold(
              fontSize: FontSize.s18,
              color: ApplicationColors.catskillWhite.withOpacity(0.5),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: const BoxDecoration(
            color: ApplicationColors.zircon,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Patients",
                      style: TextStyles.semiBold(
                        fontSize: FontSize.s16,
                        color: ApplicationColors.catskillWhite.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.doctor.patients
                          .toString()
                          .replaceAllMapped(reg, mathFunc),
                      style: TextStyles.semiBold(
                        fontSize: FontSize.s24,
                        color: ApplicationColors.denim,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Experience",
                      style: TextStyles.semiBold(
                        fontSize: FontSize.s16,
                        color: ApplicationColors.catskillWhite.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          widget.doctor.experienceInYears.toString(),
                          style: TextStyles.semiBold(
                            fontSize: FontSize.s24,
                            color: ApplicationColors.denim,
                          ),
                        ),
                        Text(
                          "yrs",
                          style: TextStyles.semiBold(
                            fontSize: FontSize.s12,
                            color: ApplicationColors.denim,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rating",
                      style: TextStyles.semiBold(
                        fontSize: FontSize.s16,
                        color: ApplicationColors.catskillWhite.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.doctor.rating.toString(),
                      style: TextStyles.semiBold(
                        fontSize: FontSize.s24,
                        color: ApplicationColors.denim,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "About Doctor",
          style: TextStyles.semiBold(
            fontSize: 25,
            color: ApplicationColors.black,
          ),
        ),
        const SizedBox(height: 5),
        RichText(
          maxLines: 3,
          text: TextSpan(
            children: [
              TextSpan(
                text: "${widget.doctor.about}...".substring(0, 120),
                style: TextStyles.semiBold(
                  fontSize: FontSize.s16,
                  color: ApplicationColors.catskillWhite.withOpacity(0.5),
                ),
              ),
              TextSpan(
                style: TextStyles.semiBold(
                  fontSize: FontSize.s16,
                  color: Colors.blue,
                ),
                text: "Read More..",
                recognizer: TapGestureRecognizer()..onTap = () async {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
