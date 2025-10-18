import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  // Headings
  static const TextStyle font32BlackBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle font24BlackSemiBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle font20BlackMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.textPrimary,
  );

  // Body text
  static const TextStyle font16BlackRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle font16BlackMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle font14BlackRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle font14GreyRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.textSecondary,
  );

  // Small text
  static const TextStyle font12GreyRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.textSecondary,
  );

  static const TextStyle font12BlackRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.textPrimary,
  );

  // Primary colored text
  static const TextStyle font16PrimaryMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primary,
  );

  static const TextStyle font14PrimaryRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primary,
  );
}
