import 'package:flutter/material.dart';
import 'package:medical_consultation_app/resources/fonts.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class Header extends StatelessWidget {
  final String title;
  final String moreButtonText;

  const Header({super.key, required this.title, required this.moreButtonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.semiBold(fontSize: FontSize.s18),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: TextStyles.semiBold(fontSize: FontSize.s18),
          ),
          onPressed: () {},
          child: Text(moreButtonText),
        )
      ],
    );
  }
}
