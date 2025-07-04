import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';
import 'package:iqra_wa_irtaqi/core/themes/text_styles.dart';

InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppColors.inputBorderGrey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppColors.inputBorderGrey),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppColors.inputBorderGrey),
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
  hintStyle: TextStyles.secondaryText40015,
);
