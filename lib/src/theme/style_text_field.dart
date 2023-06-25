import 'package:flutter/material.dart';

import 'colors.dart';
import 'input_decoration.dart';

enum IconPosition { left, right }

class StyleTextField {
  static TextStyle style({required BuildContext context, Color? primaryColor}) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          color: primaryColor ?? AppColors.white,
          fontWeight: FontWeight.normal,
        );
  }

  static InputDecoration inputDecoration({
    required BuildContext context,
    Color? fillColor,
    Color? borderColor,
    String? labelText,
    String? hintText,
    String? helperText,
    EdgeInsets? contentPadding,
    bool? isDense,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? AppColors.transparent,
      labelText: labelText,
      hintText: hintText,
      errorMaxLines: 3,
      contentPadding: contentPadding,
      isDense: isDense ?? false,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      helperText: helperText,
      disabledBorder:
          DecorationInput().outline(color: borderColor ?? AppColors.white),
      enabledBorder:
          DecorationInput().outline(color: borderColor ?? AppColors.white),
      hoverColor: AppColors.primaryColor.withOpacity(0.2),
      border: DecorationInput().outline(color: borderColor ?? AppColors.white),
      focusedBorder:
          DecorationInput().outline(color: borderColor ?? AppColors.white),
      labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: borderColor ?? AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
      focusedErrorBorder: DecorationInput().outline(
        color: AppColors.red,
      ),
      hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: borderColor ?? AppColors.white,
            fontWeight: FontWeight.normal,
          ),
      helperStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: borderColor ?? AppColors.white,
            fontWeight: FontWeight.normal,
          ),
    );
  }

  static InputDecoration inputDecorationOnlyLeft({
    required BuildContext context,
    Color? fillColor,
    String? labelText,
    String? hintText,
    String? helperText,
    EdgeInsets? contentPadding,
    bool? isDense,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? AppColors.transparent,
      labelText: labelText,
      hintText: hintText,
      errorMaxLines: 3,
      hoverColor: AppColors.primaryColor.withOpacity(0.2),
      hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
      helperText: helperText,
      helperStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
      contentPadding: contentPadding,
      isDense: isDense ?? false,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: DecorationInput.outlineLeft(color: AppColors.primaryColor),
      focusedBorder: DecorationInput.outlineLeft(color: AppColors.primaryColor),
      focusedErrorBorder: DecorationInput.outlineLeft(
        color: AppColors.white,
      ),
      disabledBorder:
          DecorationInput.outlineLeft(color: AppColors.primaryColor),
      enabledBorder: DecorationInput.outlineLeft(color: AppColors.primaryColor),
    );
  }

  static InputDecoration inputDecorationDeactive({
    required BuildContext context,
    Color? fillColor,
    String? labelText,
    String? hintText,
    String? helperText,
    EdgeInsets? contentPadding,
    bool? isDense,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? AppColors.transparent,
      labelText: labelText,
      hintText: hintText,
      errorMaxLines: 3,
      hoverColor: AppColors.primaryColor.withOpacity(0.2),
      hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
      helperText: helperText,
      helperStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
      contentPadding: contentPadding,
      isDense: isDense ?? false,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: DecorationInput().outline(color: AppColors.white),
      focusedBorder: DecorationInput().outline(color: AppColors.white),
      focusedErrorBorder: DecorationInput().outline(
        color: AppColors.white,
      ),
      disabledBorder: DecorationInput().outline(color: AppColors.white),
      enabledBorder: DecorationInput().outline(color: AppColors.white),
    );
  }
}
