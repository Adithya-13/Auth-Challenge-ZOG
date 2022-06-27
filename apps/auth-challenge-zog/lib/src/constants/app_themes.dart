import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';


@WidgetbookTheme(name: 'Light', isDefault: true)
ThemeData getLightTheme() => ThemeData(
      primarySwatch: Colors.blue,
    );


class AppThemes {
  static const blue = Color(0xFF5487ff);
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static var grey700 = Colors.grey.shade700;
  static var grey800 = Colors.grey.shade800;

  static TextStyle get headline1 => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: white,
      );

  static TextStyle get text1 => const TextStyle(
        fontSize: 16,
        color: black,
      );

  static TextStyle get text2 => TextStyle(
        fontSize: 14,
        color: grey700,
      );

  static TextStyle get subText1 => const TextStyle(
        fontSize: 12,
        color: black,
      );
}

extension TextStyleX on TextStyle {
  TextStyle get white => copyWith(
        color: AppThemes.white,
      );

  TextStyle get black => copyWith(
        color: AppThemes.black,
      );

  TextStyle get blue => copyWith(
        color: AppThemes.blue,
      );

  TextStyle get grey => copyWith(
        color: AppThemes.grey,
      );

  TextStyle get red => copyWith(
        color: Colors.red,
      );

  TextStyle get bold => copyWith(
        fontWeight: FontWeight.bold,
      );

  TextStyle get light => copyWith(
        fontWeight: FontWeight.w300,
      );
}
