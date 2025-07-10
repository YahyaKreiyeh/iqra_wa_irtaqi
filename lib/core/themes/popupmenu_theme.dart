import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';

PopupMenuThemeData popupMenuTheme() => PopupMenuThemeData(
  color: AppColors.greyShade300,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
);
