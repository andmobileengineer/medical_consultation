import 'package:flutter/material.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/dimensions.dart';
import 'package:medical_consultation_app/resources/fonts.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello Luke,',
              style: TextStyles.semiBold(fontSize: FontSize.s28),
            ),
            const SizedBox(height: AppSize.s4),
            Text(
              'How do you feel today?',
              style: TextStyles.regular(
                fontSize: FontSize.s14,
                color: ApplicationColors.catskillWhite,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 65,
          height: 65,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
          ),
        ),
      ],
    );
  }
}
