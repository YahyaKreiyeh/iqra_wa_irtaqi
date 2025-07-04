import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';
import 'package:iqra_wa_irtaqi/core/themes/text_styles.dart';

DialogThemeData dialogTheme() => DialogThemeData(
  backgroundColor: AppColors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
  titleTextStyle: TextStyles.primary60020,
  contentTextStyle: TextStyles.primaryText40015,
);
