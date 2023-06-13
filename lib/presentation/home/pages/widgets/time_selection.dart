import 'package:flutter/material.dart';
import 'package:medical_consultation_app/gestures/tap.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/fonts.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class TimeSelection extends StatelessWidget {
  const TimeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Morning",
          style: TextStyles.semiBold(
            fontSize: 25,
            color: ApplicationColors.black,
          ),
        ),
        const TimePicker(),
      ],
    );
  }
}


class TimePicker extends StatefulWidget {
  const TimePicker({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final ScrollController _controller = ScrollController();
  String? _currentTime;

  final timeSlots = [
    "08.00 AM",
    "09.00 AM",
    "10.00 AM",
    "11.00 AM",
    "12.00 PM",
    "02.00 PM",
    "03.00 PM",
    "04.00 PM",
    "05.00 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: timeSlots.length,
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemBuilder: (context, index) {
          bool isSelected =
          _currentTime != null ? timeSlots[index] == _currentTime! : false;
          return Time(
            val: timeSlots[index],
            isSelected: isSelected,
            onTimeSelected: (val) {
              setState(() {
                _currentTime = val;
              });
            },
          );
        },
      ),
    );
  }
}

class Time extends StatelessWidget {
  final String val;
  final TimeSelectionCallback? onTimeSelected;
  final bool isSelected;

  const Time(
      {super.key,
        required this.val,
        this.onTimeSelected,
        required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: isSelected
            ? Colors.blue
            : ApplicationColors.jeansBlue.withOpacity(0.2),
        elevation: isSelected ? 10 : 0,
        child: Container(
          width: 100,
          margin: const EdgeInsets.all(3.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Center(
            child: Text(
              val,
              style: TextStyles.semiBold(
                fontSize: FontSize.s20,
                color: isSelected
                    ? ApplicationColors.white
                    : ApplicationColors.black,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        if (onTimeSelected != null) {
          // Call the onDateSelected Function
          onTimeSelected!(val);
        }
      },
    );
  }
}

