import 'package:flutter/material.dart';
import 'package:movie_test_app/config/theme/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static const fontFamily = 'Montserrat';

  static TextTheme textTheme = Typography.material2021().black.apply(
    displayColor: AppColors.lightText,
    bodyColor: AppColors.lightText,
    decorationColor: AppColors.lightText,
  );

  // 40600
  static const TextStyle h1 = TextStyle(
    debugLabel: 'h1',
    fontFamily: fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  // 36600
  static const TextStyle h2 = TextStyle(
    debugLabel: 'h2',
    fontFamily: fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  // 32600
  static const TextStyle h3 = TextStyle(
    debugLabel: 'h3',
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  // 28600
  static const TextStyle h4 = TextStyle(
    debugLabel: 'h4',
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  // 24600
  static const TextStyle h5 = TextStyle(
    debugLabel: 'h5',
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  // 20600
  static const TextStyle h6 = TextStyle(
    debugLabel: 'h6',
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  // 18500
  static const TextStyle headline = TextStyle(
    debugLabel: 'headline',
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );

  //16500
  static const TextStyle subHeadline = TextStyle(
    debugLabel: 'subheadline',
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );

  // 14500
  static const TextStyle smallSubHeadline = TextStyle(
    debugLabel: 'smallsubheadline',
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );

  // 18400
  static const TextStyle bodyLarge = TextStyle(
    debugLabel: 'bodylarge',
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  // 16400
  static const TextStyle bodyMedium = TextStyle(
    debugLabel: 'bodymedium',
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  // 14400
  static const TextStyle bodySmall = TextStyle(
    debugLabel: 'bodysmall',
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  // 12400
  static const TextStyle bodyExtraSmall = TextStyle(
    debugLabel: 'bodyextrasmall',
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static const TextStyle buttonLarge = TextStyle(
    debugLabel: 'buttonLarge',
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
  static const TextStyle buttonMedium = TextStyle(
    debugLabel: 'buttonmedium',
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
  static const TextStyle buttonSmall = TextStyle(
    debugLabel: 'buttonsmall',
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
  static const TextStyle caption = TextStyle(
    debugLabel: 'caption',
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  static const TextStyle overline = TextStyle(
    debugLabel: 'overline',
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.1,
  );
  static const TextStyle plainPoppins = TextStyle(fontFamily: fontFamily);
}

extension TextThemeExtension on TextTheme {
  TextStyle get h1 => displayLarge ?? AppTextTheme.h1;

  TextStyle get h2 => displayMedium ?? AppTextTheme.h2;

  TextStyle get h3 => displaySmall ?? AppTextTheme.h3;

  TextStyle get h4 => headlineMedium ?? AppTextTheme.h4;

  TextStyle get h5 => headlineSmall ?? AppTextTheme.h5;

  TextStyle get h6 => titleLarge ?? AppTextTheme.h6;

  TextStyle get subtitle1 => titleMedium ?? AppTextTheme.headline;

  TextStyle get subtitle2 => titleSmall ?? AppTextTheme.subHeadline;

  TextStyle get body1 => bodyLarge ?? AppTextTheme.bodyLarge;

  TextStyle get body2 => bodyMedium ?? AppTextTheme.bodyMedium;

  TextStyle get caption => bodySmall ?? AppTextTheme.caption;

  TextStyle get buttonLarge => labelLarge ?? AppTextTheme.buttonLarge;

  TextStyle get buttonMedium => AppTextTheme.buttonMedium;

  TextStyle get buttonSmall => AppTextTheme.buttonSmall;

  TextStyle get overline => labelSmall ?? AppTextTheme.overline;
}
