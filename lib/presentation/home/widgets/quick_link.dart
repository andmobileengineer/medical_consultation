import 'package:flutter/material.dart';
import 'package:medical_consultation_app/resources/colors.dart';

class QuickLink extends StatelessWidget {
  final Icon icon;
  final Function? action;

  const QuickLink({super.key, required this.icon, this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        action?.call();
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: ApplicationColors.white.withOpacity(1),
        fixedSize: const Size(54, 54),
        minimumSize: const Size(54, 54),
        // padding: const EdgeInsets.all(15),
        elevation: 0,
      ),
      child: SizedBox(height: 24, width: 24, child: icon),
    );
  }
}
