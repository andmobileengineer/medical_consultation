import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';
import 'package:medical_consultation_app/utils/date_picker/gestures/tap.dart';

import '../../resources/fonts.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final bool isSelected;

  const DateWidget({
    super.key,
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: isSelected
            ? selectionColor
            : ApplicationColors.jeansBlue.withOpacity(0.2),
        elevation: isSelected ? 10 : 0,
        child: Container(
          width: width,
          margin: const EdgeInsets.all(3.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat("E", locale).format(date).toUpperCase(),
                  style: TextStyles.semiBold(
                    fontSize: FontSize.s18,
                    color: isSelected
                        ? ApplicationColors.white
                        : ApplicationColors.catskillWhite.withOpacity(0.5),
                  ),
                ),
                Text(
                  date.day.toString(), // Date
                  style: TextStyles.semiBold(
                    fontSize: FontSize.s28,
                    color: isSelected
                        ? ApplicationColors.white
                        : ApplicationColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(date);
        }
      },
    );
  }
}
