// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:movie_test_app/config/theme/app_colors.dart';
import 'package:movie_test_app/config/theme/app_text_theme.dart';

ThemeData get appTheme {
  final appTextTheme = AppTextTheme.textTheme.copyWith(
    displayLarge: AppTextTheme.textTheme.displayLarge?.merge(AppTextTheme.h1),
    displayMedium: AppTextTheme.textTheme.displayMedium?.merge(AppTextTheme.h2),
    displaySmall: AppTextTheme.textTheme.displaySmall?.merge(AppTextTheme.h3),
    headlineLarge: AppTextTheme.textTheme.headlineLarge?.merge(
      AppTextTheme.plainPoppins,
    ),
    headlineMedium: AppTextTheme.textTheme.headlineMedium?.merge(
      AppTextTheme.h4,
    ),
    headlineSmall: AppTextTheme.textTheme.headlineSmall?.merge(AppTextTheme.h5),
    titleLarge: AppTextTheme.textTheme.titleLarge?.merge(AppTextTheme.h6),
    titleMedium: AppTextTheme.textTheme.titleMedium?.merge(
      AppTextTheme.headline,
    ),
    titleSmall: AppTextTheme.textTheme.titleSmall?.merge(
      AppTextTheme.subHeadline,
    ),
    bodyLarge: AppTextTheme.textTheme.bodyLarge?.merge(AppTextTheme.bodyLarge),
    bodyMedium: AppTextTheme.textTheme.bodyMedium?.merge(
      AppTextTheme.bodyMedium,
    ),
    bodySmall: AppTextTheme.textTheme.bodySmall?.merge(AppTextTheme.bodySmall),
    labelLarge: AppTextTheme.textTheme.labelLarge?.merge(
      AppTextTheme.buttonLarge,
    ),
    labelMedium: AppTextTheme.textTheme.labelMedium?.merge(
      AppTextTheme.plainPoppins,
    ),
    labelSmall: AppTextTheme.textTheme.labelSmall?.merge(AppTextTheme.overline),
  );

  return ThemeData.light(useMaterial3: true).copyWith(
    platform: TargetPlatform.iOS,
    primaryColor: AppColors.primary,
    colorScheme: AppColors.colorScheme(brightness: Brightness.light),
    scaffoldBackgroundColor: AppColors.lightBackground.paper,
    unselectedWidgetColor: AppColors.lightText.secondary,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.lightText.secondary),
      color: AppColors.lightBackground.paper,
      surfaceTintColor: AppColors.lightBackground.paper,
      foregroundColor: AppColors.lightText,
      shadowColor: Colors.grey.shade600.withOpacity(0.32),
      elevation: 1.0,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.lightBackground.paper,
      modalBackgroundColor: AppColors.lightBackground.paper,
      surfaceTintColor: AppColors.lightBackground.paper,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, 45),
        textStyle: appTextTheme.buttonLarge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.lightBackground.paper,
        disabledBackgroundColor: AppColors.lightActionState.disabledBackground,
        disabledForegroundColor: AppColors.lightActionState.disabled,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(0, 48)),
        textStyle: WidgetStatePropertyAll(appTextTheme.buttonLarge),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              width: 1.0,
              color: AppColors.lightActionState.disabledBackground.withOpacity(
                0.24,
              ),
            );
          }
          return BorderSide(
            width: 1.0,
            color: AppColors.primary.withOpacity(0.48),
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.lightActionState.disabled.withOpacity(0.8);
          }
          return AppColors.primary;
        }),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.primary),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: AppColors.lightBackground.paper,
      color: AppColors.lightBackground.paper,
      elevation: 4,
      shadowColor: Colors.grey.shade600.withOpacity(0.32),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 14.0),
      errorMaxLines: 5,
      filled: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.lightActionState.disabledBackground;
        }
        return AppColors.lightBackground.paper;
      }),
      constraints: const BoxConstraints(minHeight: 44),
      hintStyle: appTextTheme.bodyMedium?.copyWith(
        color: AppColors.lightText.disabled,
      ),
      iconColor: AppColors.lightActionState.active,
      suffixIconColor: AppColors.lightText.secondary,
      errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.border),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.primary),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.error),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: appTextTheme.caption.copyWith(
        color: AppColors.lightText.disabled,
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        final color =
            states.contains(WidgetState.error)
                ? AppColors.error
                : states.contains(WidgetState.focused)
                ? AppColors.primary
                : AppColors.lightText.disabled;
        return appTextTheme.caption.copyWith(color: color);
      }),
    ),
    textTheme: appTextTheme,
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.lightBackground.defaults,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: appTextTheme.bodySmall?.copyWith(
        color: AppColors.lightText.secondary,
        fontSize: 8.0,
      ),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: appTextTheme.bodyMedium?.copyWith(
        color: AppColors.lightText.secondary,
        fontWeight: FontWeight.w600,
      ),
      labelStyle: appTextTheme.bodyMedium?.copyWith(
        color: AppColors.lightText.primary,
        fontWeight: FontWeight.w600,
      ),
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary, width: 3),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: AppColors.divider,
      dividerHeight: 1,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.lightActionState.active;
      }),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightBackground.defaults,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(AppColors.lightBackground.paper),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.lightBackground.paper;
      }),
      side: const BorderSide(color: AppColors.border, width: 2),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightBackground.paper;
        }
        return AppColors.lightActionState.active;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.lightBackground.defaults;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.lightActionState.active;
      }),
    ),
    menuTheme: MenuThemeData(
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColors.lightBackground.paper,
        ),
        surfaceTintColor: WidgetStatePropertyAll(
          AppColors.lightBackground.paper,
        ),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: appTextTheme.bodyMedium?.copyWith(color: AppColors.lightText),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColors.lightBackground.paper,
        ),
        surfaceTintColor: WidgetStatePropertyAll(
          AppColors.lightBackground.paper,
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.lightBackground.paper,
      surfaceTintColor: AppColors.lightBackground.paper,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(),
    ),
    iconTheme: const IconThemeData(color: AppColors.lightText),
  );
}
