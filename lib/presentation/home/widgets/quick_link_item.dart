
import 'package:flutter/material.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/fonts.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class QuickLinkItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function? action;
  final bool enabled;

  const QuickLinkItem({
    Key? key,
    required this.title,
    required this.icon,
    this.action,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Column(
        children: [
          icon,
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyles.semiBold(
              color: ApplicationColors.catskillWhite,
              fontSize: FontSize.s14,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}