import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/themes/colors.dart';
import 'package:uq_system_app/core/themes/styles.dart';
import 'package:uq_system_app/core/themes/typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final AppTheme darkTheme = AppTheme(
  name: 'dark',
  brightness: Brightness.dark,
  colors: const AppColors(
    primarySwatch: Colors.deepOrange,
    primary: Color(0xFF5F5F5F),
    blurryTitle: Color(0xFF868686),
    secondary: Color(0xFFEE9B01),
    tertiary: Color(0xFF4175B1),
    quaternary: Color(0xFF4BA77A),
    quinary: Color(0xFFD9D9D9),
    accent: Color.fromARGB(255, 173, 173, 173),
    background: Color(0xFFF1F1F1),
    backgroundDark: Color(0xFF0E1118),
    disabled: Color(0xFFE4E4E4),
    information: Color(0xFF5487F5),
    success: Color(0xFF19C18F),
    alert: Color(0xFFFBA707),
    warning: Color(0xFFFF9D5C),
    error: Color(0xFFFF0000),
    text: Color(0xFF333333),
    border: Color(0xFF454F60),
    hint: Color(0xffA2A2A2),
    divider: Color(0xFFD9D9D9),
  ),
  typographies: AppTypography(
    title1: GoogleFonts.zenKakuGothicAntique(
      fontSize: 32,
      color: const Color(0xFF333333),
      fontWeight: FontWeight.w700,
      height: 1.3,
    ),
    title1SemiBold: GoogleFonts.zenKakuGothicAntique(
      fontSize: 32,
      color: const Color(0xFF333333),
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    title1Normal: GoogleFonts.zenKakuGothicAntique(
      fontSize: 32,
      color: const Color(0xFF333333),
      fontWeight: FontWeight.w400,
      height: 1.3,
    ),
    title2: GoogleFonts.zenKakuGothicAntique(
      fontSize: 24,
      color: const Color(0xFF333333),
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    title2Bold: GoogleFonts.zenKakuGothicAntique(
      fontSize: 24,
      color: const Color(0xFF333333),
      fontWeight: FontWeight.w700,
      height: 1.3,
    ),
    title3: GoogleFonts.zenKakuGothicAntique(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF333333),
      height: 1.3,
    ),
    title3Bold: GoogleFonts.zenKakuGothicAntique(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.3,
    ),
    body: GoogleFonts.zenKakuGothicAntique(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: const Color(0xFF333333),
    ),
    bodyBold: GoogleFonts.zenKakuGothicAntique(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    subBody1: GoogleFonts.zenKakuGothicAntique(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: const Color(0xFF333333),
    ),
    subBodyBold1: GoogleFonts.zenKakuGothicAntique(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    subBody2: GoogleFonts.zenKakuGothicAntique(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: const Color(0xFF333333),
    ),
    subBodyBold2: GoogleFonts.zenKakuGothicAntique(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    subBody3: GoogleFonts.zenKakuGothicAntique(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: const Color(0xFF333333),
    ),
    subBodyBold3: GoogleFonts.zenKakuGothicAntique(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    caption1: GoogleFonts.zenKakuGothicAntique(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.3,
    ),
    caption1Bold: GoogleFonts.zenKakuGothicAntique(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    caption2: GoogleFonts.zenKakuGothicAntique(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.3,
    ),
    caption2Bold: GoogleFonts.zenKakuGothicAntique(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
  ),
  styles: AppStyles(
    buttonSmall: ButtonStyle(
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      ),
      shape: const MaterialStatePropertyAll(
        StadiumBorder(),
      ),
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.zenKakuGothicAntique(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll(Size.zero),
    ),
    buttonMedium: ButtonStyle(
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
      shape: const MaterialStatePropertyAll(
        StadiumBorder(),
      ),
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.zenKakuGothicAntique(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll(Size.zero),
    ),
    buttonLarge: ButtonStyle(
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      ),
      shape: const MaterialStatePropertyAll(
        StadiumBorder(),
      ),
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.zenKakuGothicAntique(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll(Size.zero),
    ),
    buttonText: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      // splashFactory: NoSplash.splashFactory,
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.zenKakuGothicAntique(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
    ),
    textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
    shadow: const [
      BoxShadow(
        color: Color(0xFFFFFFFF),
        offset: Offset(0, 4),
        blurRadius: 4,
        spreadRadius: 0,
      ),
    ],
  ),
);

class AppTheme extends ThemeExtension<AppTheme> {
  static final AppTheme dark = darkTheme;
  static final AppTheme defaultTheme = darkTheme;

  final String name;
  final Brightness brightness;
  final AppColors colors;
  final AppTypography typographies;
  final AppStyles styles;

  const AppTheme({
    required this.name,
    required this.brightness,
    required this.colors,
    required this.typographies,
    required this.styles,
  });

  ColorScheme get _baseColorScheme => brightness == Brightness.dark
      ? const ColorScheme.dark() //
      : const ColorScheme.light();

  ThemeData get themeData => ThemeData(
        platform: TargetPlatform.iOS,
        extensions: [this],
        primarySwatch: colors.primarySwatch,
        primaryColor: colors.primary,
        dialogBackgroundColor: Colors.white,
        unselectedWidgetColor: colors.hint,
        disabledColor: colors.disabled,
        scaffoldBackgroundColor: colors.background,
        hintColor: colors.hint,
        dividerColor: colors.divider,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white
        ),
        datePickerTheme: DatePickerThemeData(
            todayForegroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.white;
                } else {
                  return Colors.blue;
                }
              },
            ),
            todayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.blue;
                } else {
                  return Colors.white;
                }
              },
            ),
            dayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.blue;
                } else {
                  return Colors.white;
                }
              },
            ),
            rangeSelectionBackgroundColor: Colors.blue,
            dividerColor: colors.divider,
            surfaceTintColor: Colors.white,
            headerBackgroundColor: colors.tertiary,
            headerForegroundColor: Colors.white),
        colorScheme: _baseColorScheme.copyWith(
          primary: colors.primary,
          onPrimary: Colors.white,
          secondary: colors.secondary,
          onSecondary: colors.text,
          error: colors.error,
          shadow: colors.border,
          background: colors.background,
          surface: Colors.white,
          onSurface: colors.primary,
          onBackground: Colors.white,
        ),
        textTheme: TextTheme(
          bodyMedium: typographies.body.withColor(darkTheme.colors.text),
        ),
        dialogTheme: DialogTheme(
            titleTextStyle: typographies.title3,
            contentTextStyle:
                typographies.subBodyBold1.withColor(colors.primary),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: colors.background,
            titleTextStyle: typographies.title3,
            iconTheme: IconThemeData(color: colors.text)),
        tabBarTheme: TabBarTheme(
          labelStyle: typographies.body,
          unselectedLabelStyle: typographies.body,
          labelColor: colors.accent,
          unselectedLabelColor: colors.hint,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.text
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        iconTheme: IconThemeData(color: colors.primary),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.text
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: styles.buttonLarge.copyWith(
            side: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(color: colors.disabled);
              }

              if (states.isEmpty ||
                  [
                    MaterialState.pressed,
                    MaterialState.hovered,
                    MaterialState.focused,
                  ].any(states.contains)) {
                return BorderSide(color: colors.primary);
              }

              return null;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: styles.buttonLarge.copyWith(
            foregroundColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null;
            }),
          ),
        ),
        primaryTextTheme: TextTheme(
          bodyMedium: typographies.body.withColor(darkTheme.colors.text),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintStyle: typographies.body.withColor(colors.primary),
          labelStyle: typographies.body.withColor(colors.accent),
          errorMaxLines: 0,
          border: InputBorder.none,
          fillColor: const Color(0xffF7F8FA),
        ),
        checkboxTheme: CheckboxThemeData(
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: MaterialStateBorderSide.resolveWith((states) => BorderSide(
            color: colors.primary,
            width: 1
          )),
          fillColor: MaterialStateProperty.resolveWith((states) {
            return Colors.white;
          }),
          checkColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.selected)
                ? colors.primary
                : states.contains(MaterialState.pressed) ? colors.primary : Colors.white;
          }),
        ),
        radioTheme: const RadioThemeData(
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colors.background,
          elevation: 1,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: colors.primary,
          unselectedItemColor: colors.border,
          selectedIconTheme: IconThemeData(size: 32, color: colors.primary),
          unselectedIconTheme: IconThemeData(size: 32, color: colors.border),
          selectedLabelStyle: typographies.caption2Bold,
          unselectedLabelStyle: typographies.caption2Bold,
          type: BottomNavigationBarType.fixed,
        ),
        dividerTheme: DividerThemeData(
          color: colors.divider,
          thickness: 1,
          space: 1,
        ),
        tooltipTheme: TooltipThemeData(
          preferBelow: true,
          showDuration: const Duration(seconds: 2),
          textStyle: typographies.caption2.withColor(colors.text),
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: colors.backgroundDark,
                offset: Offset.zero,
                blurRadius: 20,
              )
            ],
          ),
        ),
      );

  @override
  AppTheme copyWith({
    String? name,
    AppColors? colors,
    AppTypography? typographies,
    AppStyles? styles,
  }) {
    return AppTheme(
      brightness: brightness,
      name: name ?? this.name,
      colors: colors ?? this.colors,
      typographies: typographies ?? this.typographies,
      styles: styles ?? this.styles,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      brightness: brightness,
      name: name,
      colors: colors.lerp(other.colors, t),
      typographies: typographies.lerp(other.typographies, t),
      styles: styles,
    );
  }
}
