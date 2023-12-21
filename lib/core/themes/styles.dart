import 'package:flutter/material.dart';

class AppStyles {
  final ButtonStyle buttonSmall;
  final ButtonStyle buttonMedium;
  final ButtonStyle buttonLarge;
  final ButtonStyle buttonText;
  final TextStyle textStyle;
  final List<BoxShadow> shadow;

  const AppStyles({
    required this.textStyle,
    required this.buttonSmall,
    required this.buttonMedium,
    required this.buttonLarge,
    required this.buttonText,
    required this.shadow,
  });
}
