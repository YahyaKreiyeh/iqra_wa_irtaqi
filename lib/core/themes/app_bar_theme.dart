import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';
import 'package:iqra_wa_irtaqi/core/themes/text_styles.dart';

AppBarTheme appBarTheme() => AppBarTheme(
  backgroundColor: AppColors.appBarBackground,
  surfaceTintColor: AppColors.appBarBackground,
  foregroundColor: AppColors.appBarForeground,
  titleTextStyle: TextStyles.primaryText60022,
);

// SizedBox(
            //   height: 290,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     padding: EdgeInsets.fromLTRB(
            //       kHorizontalPadding,
            //       20,
            //       kHorizontalPadding,
            //       0,
            //     ),
            //     itemCount: 3,
            //     itemBuilder: (context, index) => SizedBox(
            //       width: 200,
            //       child: EventCard(
            //         margin: EdgeInsets.symmetric(vertical: 10),
            //         index: index,
            //       ),
            //     ),
            //   ),
            // ),



            