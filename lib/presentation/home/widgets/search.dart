import 'package:flutter/material.dart';
import 'package:medical_consultation_app/resources/colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: 2,
            color: ApplicationColors.lighterGrey3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: 2,
            color: ApplicationColors.lighterGrey3,
          ),
        ),
        filled: true,
        fillColor: Colors.white70,
        prefixIcon: const Icon(
          Icons.search,
          color: ApplicationColors.grey4,
        ),
        hintText: 'Search here ...',
      ),
      cursorColor: ApplicationColors.grey4,
    );
  }
}
