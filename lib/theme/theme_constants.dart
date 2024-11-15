import '/constants/size_unit.dart';
import '/theme/palette.dart';
import 'package:flutter/material.dart';
import '/theme/theme_guide.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Mulish",
  brightness: Brightness.light,
  primaryColor: Palette.primary,
  scaffoldBackgroundColor: Palette.pureWhite,
  appBarTheme: const AppBarTheme(
      foregroundColor: Palette.pureWhite,
      backgroundColor: Palette.primary,
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
    minimumSize: WidgetStateProperty.all(const Size(45, 45)),
    padding: const WidgetStatePropertyAll(EdgeInsets.all(SizeUnit.md)),
    iconSize: const WidgetStatePropertyAll(30),
    shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: ThemeGuide.borderRadius())),
    // backgroundColor: const WidgetStatePropertyAll(Palette.pureWhite),
    // foregroundColor: const WidgetStatePropertyAll(Palette.dark),
  )),
  chipTheme: const ChipThemeData(
    // shape: RoundedRectangleBorder(borderRadius: ThemeGuide.borderRadius()),
    side: BorderSide.none,
  ),
  datePickerTheme: DatePickerThemeData(
      rangeSelectionBackgroundColor: Palette.primary.withOpacity(.5),
      inputDecorationTheme: const InputDecorationTheme()),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(10, 10)),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: ThemeGuide.borderRadius())),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          backgroundColor: WidgetStateProperty.all(Palette.primary),
          elevation: WidgetStateProperty.all(0))),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    minimumSize: WidgetStateProperty.all(const Size(10, 10)),
    side: const WidgetStatePropertyAll(BorderSide(color: Palette.primary)),
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    foregroundColor: const WidgetStatePropertyAll(Palette.primary),
    shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: ThemeGuide.borderRadius())),
  )),
  filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
    backgroundColor: const WidgetStatePropertyAll(Palette.secondary),
    shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: ThemeGuide.borderRadius())),
  )),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0, backgroundColor: Palette.primary),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          textStyle: const WidgetStatePropertyAll(
              TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          foregroundColor: WidgetStateProperty.all(Palette.primary),
          overlayColor:
              WidgetStateProperty.all(Palette.secondary.withOpacity(.1)))),
  canvasColor: Palette.light,
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Palette.primary,
      onPrimary: Colors.white,
      secondary: Palette.secondary,
      onSecondary: Palette.dark,
      error: Palette.red,
      onError: Colors.white,
      surface: Palette.light,
      onSurface: Palette.dark),
  dialogBackgroundColor: Colors.white,
);
