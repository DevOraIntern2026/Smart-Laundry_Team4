import 'package:flutter/widgets.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();
  static const String fontFamily = 'Tajawal';
  // Heading
  static TextStyle heading(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    fontFamily: fontFamily,
  );

  // Title Medium
  static TextStyle titleMedium(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 10),
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: fontFamily,
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
    fontFamily: fontFamily,
  );
  static TextStyle mediumTitle10(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.gray,
        fontFamily: fontFamily,
      );
  static TextStyle mediumTitle11(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 11),
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? AppColors.gray,
    fontFamily: fontFamily,
  );
  static TextStyle mediumTitle16(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? AppColors.gray,
    fontFamily: fontFamily,
  );

  static TextStyle profileTileHeader18(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? AppColors.darkblue,
    fontFamily: fontFamily,
  );
  static TextStyle profileSubHeader12(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 12),
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? AppColors.darkblue,
    fontFamily: fontFamily,
  );
  static TextStyle f18w700(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? AppColors.darkblue,
    fontFamily: fontFamily,
  );
  static TextStyle f12w700(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? AppColors.darkblue,
    fontFamily: fontFamily,
  );
  static TextStyle f14w400(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? AppColors.darkblue,
    fontFamily: fontFamily,
  );
  static TextStyle f12w500(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 12),
    fontWeight: fontWeight ?? FontWeight.w500,
    color: color ?? AppColors.darkblue,
    fontFamily: fontFamily,
  );
  static TextStyle f20w700(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 20),
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? AppColors.darkblue,
    fontFamily: fontFamily,
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
