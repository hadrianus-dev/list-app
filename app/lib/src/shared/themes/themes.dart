import 'package:flutter/material.dart';
import 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    appBarTheme: AppBarTheme(
        centerTitle: true, backgroundColor: lightColorScheme.primaryContainer),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary),
    segmentedButtonTheme: _sgmentedButtonTheme);

ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    appBarTheme: AppBarTheme(
        centerTitle: true, backgroundColor: darkColorScheme.primaryContainer));

SegmentedButtonThemeData get _sgmentedButtonTheme =>
    SegmentedButtonThemeData(style:
        ButtonStyle(textStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const TextStyle(
          fontSize: 9,
        );
      }
      return const TextStyle(
        fontSize: 12,
      );
    })));
