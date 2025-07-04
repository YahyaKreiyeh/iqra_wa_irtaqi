import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';

CardThemeData cardTheme() => CardThemeData(
  elevation: 3,
  shadowColor: AppColors.cardShadow,
  color: AppColors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
);
