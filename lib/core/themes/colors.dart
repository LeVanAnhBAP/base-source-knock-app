import 'package:flutter/material.dart';

class AppColors {
  final MaterialColor primarySwatch;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color quaternary;
  final Color quinary;
  final Color accent;
  final Color background;
  final Color backgroundDark;
  final Color disabled;
  final Color information;
  final Color success;
  final Color alert;
  final Color warning;
  final Color error;
  final Color text;
  final Color border;
  final Color hint;
  final Color divider;

  const AppColors({
    required this.primarySwatch,
    required this.primary,
    required this.tertiary,
    required this.secondary,
    required this.quaternary,
    required this.quinary,
    required this.accent,
    required this.background,
    required this.backgroundDark,
    required this.disabled,
    required this.information,
    required this.success,
    required this.alert,
    required this.warning,
    required this.error,
    required this.text,
    required this.border,
    required this.hint,
    required this.divider,
  });

  AppColors lerp(covariant dynamic other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primarySwatch: primarySwatch,
      primary: Color.lerp(primary, other.primary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      quaternary: Color.lerp(quaternary, other.quaternary, t)!,
      quinary: Color.lerp(quinary, other.quinary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      information: Color.lerp(information, other.information, t)!,
      success: Color.lerp(success, other.success, t)!,
      alert: Color.lerp(alert, other.alert, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      text: Color.lerp(text, other.text, t)!,
      border: Color.lerp(border, other.border, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }
}
