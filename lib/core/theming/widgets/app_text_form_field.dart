import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.keyboardType,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixText,
    this.prefixStyle,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.gray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        // Here we combine prefixIcon and prefixText
        prefixIcon: prefixIcon != null || prefixText != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  if (prefixText != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        prefixText!,
                        style: prefixStyle ?? TextStyles.font14DarkBlueMedium,
                      ),
                    ),
                ],
              )
            : null,
        fillColor: backgroundColor ?? ColorsManager.moreLightGray,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
