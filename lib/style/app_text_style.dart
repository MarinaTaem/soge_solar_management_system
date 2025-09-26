import 'package:flutter/material.dart';
import 'package:solar_management_system/style/app_colors.dart';

class AppTextStyle {
  static const TextStyle body = TextStyle(
    color: AppColor.textPrimary,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle tittle = TextStyle(
    color: AppColor.primary,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle tittleCard = TextStyle(
    color: AppColor.textPrimary,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle inActiveTitle = TextStyle(
    color: AppColor.unfocus,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle unfocusTitle = TextStyle(
    color: AppColor.textSecondary,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
}
