import 'package:flutter/material.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/fonts.dart';

class TextStyles {
  static TextStyle bold({
    double height = 1.2,
    double fontSize = FontSize.s18,
    Color color = ApplicationColors.mineShaft,
    double? letterSpacing,
  }) =>
      _getTextStyle(height, fontSize, FontConstants.fontFamily,
          FontWeightManager.bold, color, TextDecoration.none, letterSpacing);

  static TextStyle semiBold({
    double height = 1.2,
    double fontSize = FontSize.s18,
    Color color = ApplicationColors.mineShaft,
    double? letterSpacing,
  }) =>
      _getTextStyle(
          height,
          fontSize,
          FontConstants.fontFamily,
          FontWeightManager.semiBold,
          color,
          TextDecoration.none,
          letterSpacing);

  static TextStyle medium({
    double height = 1.2,
    double fontSize = FontSize.s18,
    Color color = ApplicationColors.mineShaft,
    double? letterSpacing,
  }) =>
      _getTextStyle(height, fontSize, FontConstants.fontFamily,
          FontWeightManager.medium, color, TextDecoration.none, letterSpacing);

  static TextStyle regular({
    double height = 1.2,
    double fontSize = FontSize.s18,
    Color color = ApplicationColors.mineShaft,
    TextDecoration decoration = TextDecoration.none,
    double? letterSpacing,
  }) =>
      _getTextStyle(height, fontSize, FontConstants.fontFamily,
          FontWeightManager.regular, color, decoration, letterSpacing);

  static TextStyle light({
    double height = 1.2,
    double fontSize = FontSize.s18,
    Color color = ApplicationColors.mineShaft,
    double? letterSpacing,
  }) =>
      _getTextStyle(
        height,
        fontSize,
        FontConstants.fontFamily,
        FontWeightManager.light,
        color,
        TextDecoration.none,
        letterSpacing,
      );

  static TextStyle _getTextStyle(
      double height,
      double fontSize,
      String fontFamily,
      FontWeight fontWeight,
      Color color,
      TextDecoration decoration,
      [double? letterSpacing]) {
    return TextStyle(
        height: height,
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration,
        letterSpacing: letterSpacing);
  }
}
