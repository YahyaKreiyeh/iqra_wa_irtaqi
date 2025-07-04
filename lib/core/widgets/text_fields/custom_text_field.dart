import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iqra_wa_irtaqi/core/helpers/spacing.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';
import 'package:iqra_wa_irtaqi/core/themes/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final int maxLines;
  final int? maxLength;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool isRequired;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool disabled;
  final bool filled;
  final bool showBorder;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final Function(PointerDownEvent)? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    this.controller,
    this.onChanged,
    this.maxLines = 1,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isRequired = false,
    this.textInputType,
    this.textInputAction,
    this.errorText,
    this.onEditingComplete,
    this.disabled = false,
    this.obscureText = false,
    this.filled = true,
    this.showBorder = true,
    super.key,
    this.labelText,
    this.onTapOutside,
    this.maxLength,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (labelText != null && labelText != '')
        Column(
          children: [
            Text(labelText!, style: TextStyles.primaryText40015),
            const VerticalSpace(8),
          ],
        ),
      TextField(
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        onTapOutside:
            onTapOutside ??
            (_) => FocusScope.of(context).requestFocus(FocusNode()),
        keyboardType: textInputType,
        maxLines: maxLines,
        onEditingComplete: onEditingComplete,
        controller: controller,
        onChanged: onChanged,
        readOnly: disabled,
        canRequestFocus: !disabled,
        obscureText: obscureText,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          fillColor: disabled
              ? AppColors.neutral100.withAlpha((0.5 * 255).toInt())
              : AppColors.inputFillWhite,
          filled: filled,
          hintText: hintText,
          errorText: errorText,
          counterText: '',
          focusedBorder: showBorder ? null : InputBorder.none,
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, size: 24, color: Colors.grey)
              : null,
        ),
      ),
    ],
  );
}
