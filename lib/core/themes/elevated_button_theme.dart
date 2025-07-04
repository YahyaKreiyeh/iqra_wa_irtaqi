import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';

ElevatedButtonThemeData elevatedButtonTheme() => ElevatedButtonThemeData(
  style: ButtonStyle(
    maximumSize: WidgetStateProperty.all(
      const Size(double.infinity, buttonHeight),
    ),
    minimumSize: WidgetStateProperty.all(
      const Size(double.infinity, buttonHeight),
    ),
  ),
);
