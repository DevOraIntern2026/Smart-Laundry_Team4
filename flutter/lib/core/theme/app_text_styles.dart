import 'package:flutter/widgets.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();
  static const String _fontFamily = 'Tajawal';
  // Heading
  static TextStyle heading(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    fontFamily: _fontFamily,
  );

  // Title Medium
  static TextStyle titleMedium(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 10),
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: _fontFamily,
  );

  //------------ Medium Text ------------//
  static TextStyle mediumTitle13(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 13),
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? AppColors.black,
    fontFamily: _fontFamily,
  );
  static TextStyle mediumTitle10(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.gray,
        fontFamily: _fontFamily,
      );
  static TextStyle mediumTitle11(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 11),
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? AppColors.gray,
    fontFamily: _fontFamily,
  );
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    // 500 --599
    // mobile
    return width / 400;
  } else if (width < 900) {
    //800
    // tablet
    return width / 700;
  } else {
    // desktop
    return width / 1000;
  }
}
