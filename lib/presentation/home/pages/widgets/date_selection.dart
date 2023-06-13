import 'package:flutter/material.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';
import 'package:medical_consultation_app/utils/date_picker/date_picker_widget.dart';

class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  final DatePickerController _controller = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Select Schedule",
          style: TextStyles.semiBold(
            fontSize: 25,
            color: ApplicationColors.black,
          ),
        ),
        DatePicker(
          DateTime.now(),
          width: 65,
          height: 100,
          controller: _controller,
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          inactiveDates: [
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
            DateTime.now().add(const Duration(days: 7))
          ],
          onDateChange: (date) {
            // New date selected
            setState(() {
              // _selectedValue = date;
            });
          },
        )
      ],
    );
  }
}
