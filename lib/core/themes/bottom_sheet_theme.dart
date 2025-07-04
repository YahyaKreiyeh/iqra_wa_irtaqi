import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';

BottomSheetThemeData bottomSheetTheme() => const BottomSheetThemeData(
  backgroundColor: AppColors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
  ),
);
