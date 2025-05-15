import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Add color here for other colors needed
  static const Color formFill = Color(0xFFF2F4F7);
  static const Color borderCard = Color(0xFFE9EAED);

  static ColorScheme colorScheme({Brightness brightness = Brightness.light}) {
    final bool isDark = brightness == Brightness.dark;

    final cardColor = isDark ? darkBackground.paper : lightBackground.paper;
    final backgroundColor = isDark ? darkBackground.paper : lightBackground.paper;

    final bool primaryIsDark = ThemeData.estimateBrightnessForColor(primary) == Brightness.dark;
    final bool secondaryIsDark = ThemeData.estimateBrightnessForColor(secondary) == Brightness.dark;

    return ColorScheme(
      primary: primary,
      secondary: secondary,
      surface: cardColor,
      error: error,
      onPrimary: primaryIsDark ? Colors.white : Colors.black,
      onSecondary: secondaryIsDark ? Colors.white : Colors.black,
      onSurface: isDark ? Colors.white : Colors.black,
      onError: isDark ? Colors.black : Colors.white,
      brightness: brightness,
      // DEPRECATED (newest deprecations at the bottom)
      // ignore: deprecated_member_use
      background: backgroundColor,
      // ignore: deprecated_member_use
      onBackground: primaryIsDark ? Colors.white : Colors.black,
    );
  }

  static const ShadeColor primary = ShadeColor(0xFF009688, <String, Color>{
    _ShadeColorKeys.lighter: Color(0xFFB2DFDB),
    _ShadeColorKeys.light: Color(0xFF4DB6AC),
    _ShadeColorKeys.main: Color(0xFF009688),
    _ShadeColorKeys.dark: Color(0xFF00796B),
    _ShadeColorKeys.darker: Color(0xFF004D40),
  });

  static const ShadeColor secondary = ShadeColor(0xFFF87500, <String, Color>{
    _ShadeColorKeys.lighter: Color(0xFFFCEDB4),
    _ShadeColorKeys.light: Color(0xFFF8C316),
    _ShadeColorKeys.main: Color(0xFFF87500),
    _ShadeColorKeys.dark: Color(0xFFF87500),
    _ShadeColorKeys.darker: Color(0xFF602E00),
  });

  static const ShadeColor info = ShadeColor(0xFF74CAFF, <String, Color>{
    _ShadeColorKeys.lighter: Color(0xFFD0F2FF),
    _ShadeColorKeys.light: Color(0xFF74CAFF),
    _ShadeColorKeys.main: Color(0xFF1890FF),
    _ShadeColorKeys.dark: Color(0xFF0C53B7),
    _ShadeColorKeys.darker: Color(0xFF04297A),
  });

  static const ShadeColor success = ShadeColor(0xFF2CCD70, <String, Color>{
    _ShadeColorKeys.lighter: Color(0xFFEAFAF1),
    _ShadeColorKeys.light: Color(0xFF72DE9F),
    _ShadeColorKeys.main: Color(0xFF2CCD70),
    _ShadeColorKeys.dark: Color(0xFF1F9250),
    _ShadeColorKeys.darker: Color(0xFF12562F),
  });

  static const ShadeColor warning = ShadeColor(0xFFFFC700, <String, Color>{
    _ShadeColorKeys.lighter: Color(0xFFFFF9EC),
    _ShadeColorKeys.light: Color(0xFFFFD954),
    _ShadeColorKeys.main: Color(0xFFFFC107),
    _ShadeColorKeys.dark: Color(0xFFB58D00),
    _ShadeColorKeys.darker: Color(0xFF6B5400),
  });

  static const ShadeColor error = ShadeColor(0xFFE04A38, <String, Color>{
    _ShadeColorKeys.lighter: Color(0xFFFDEBEC),
    _ShadeColorKeys.light: Color(0xFFE98F85),
    _ShadeColorKeys.main: Color(0xFFE04A38),
    _ShadeColorKeys.dark: Color(0xFFB12D1E),
    _ShadeColorKeys.darker: Color(0xFF6A1A0F),
  });

  static const MaterialColor grey = MaterialColor(0xFF737373, <int, Color>{
    100: Color(0xFFFAFAFA),
    200: Color(0xFFE5E5E5),
    300: Color(0xFFD4D4D4),
    400: Color(0xFFA3A3A3),
    500: Color(0xFF737373),
    600: Color(0xFF525252),
    700: Color(0xFF404040),
    800: Color(0xFF262626),
    900: Color(0xFF171717),
  });

  static const ShadeTextColor lightText = ShadeTextColor(0xFF1F1D2B, <String, Color>{
    _ShadeColorKeys.primary: Color(0xFF1F1D2B),
    _ShadeColorKeys.secondary: Color(0xFF6B6879),
    _ShadeColorKeys.disabled: Color(0xFF8D8A9C),
  });

  static const ShadeTextColor darkText = ShadeTextColor(0xFFFFFFFF, <String, Color>{
    _ShadeColorKeys.primary: Color(0xFFFFFFFF),
    _ShadeColorKeys.secondary: Color(0xFF8D8A9C),
    _ShadeColorKeys.disabled: Color(0xFF6B6879),
  });

  static const ShadeTextColor purple = ShadeTextColor(0xFF7339EA, <String, Color>{
    _ShadeColorKeys.primary: Color(0xFF7339EA),
    _ShadeColorKeys.secondary: Color(0xFFF7F5FF),
    _ShadeColorKeys.disabled: Color(0xFF8D8A9C),
  });

  static const ShadeBackgroundColor lightBackground = ShadeBackgroundColor(0x148D8A9C, <String, Color>{
    _ShadeColorKeys.defaults: Color(0x148D8A9C),
    _ShadeColorKeys.paper: Color(0xFFFFFFFF),
    _ShadeColorKeys.neutral: Color(0xFFF8F5FF),
  });

  static const ShadeBackgroundColor darkBackground = ShadeBackgroundColor(0xFF141220, <String, Color>{
    _ShadeColorKeys.defaults: Color(0xFF141220),
    _ShadeColorKeys.paper: Color(0xFF1F1D2B),
    _ShadeColorKeys.neutral: Color(0x1F8D8A9C),
  });

  static const Color divider = Color(0x3D8D8A9C);
  static const Color border = Color(0x52919EAB);

  static const ShadeStateColor lightActionState = ShadeStateColor(0xFF6B6879, <String, Color>{
    _ShadeColorKeys.active: Color(0xFF6B6879),
    _ShadeColorKeys.hover: Color(0x148D8A9C),
    _ShadeColorKeys.selected: Color(0x298D8A9C),
    _ShadeColorKeys.disabled: Color(0xCC8D8A9C),
    _ShadeColorKeys.disabledBackground: Color(0x3D8D8A9C),
    _ShadeColorKeys.focus: Color(0x3D8D8A9C),
  });

  static const ShadeStateColor darkActionState = ShadeStateColor(0xFF8D8A9C, <String, Color>{
    _ShadeColorKeys.active: Color(0xFF8D8A9C),
    _ShadeColorKeys.hover: Color(0x148D8A9C),
    _ShadeColorKeys.selected: Color(0x298D8A9C),
    _ShadeColorKeys.disabled: Color(0xCC8D8A9C),
    _ShadeColorKeys.disabledBackground: Color(0x3D8D8A9C),
    _ShadeColorKeys.focus: Color(0x3D8D8A9C),
  });
}

mixin _ShadeColorKeys {
  static const lighter = 'lighter';
  static const light = 'light';
  static const main = 'main';
  static const dark = 'dark';
  static const darker = 'darker';
  static const primary = 'primary';
  static const secondary = 'secondary';
  static const disabled = 'disabled';
  static const defaults = 'defaults';
  static const paper = 'paper';
  static const neutral = 'neutral';
  static const active = 'active';
  static const hover = 'hover';
  static const selected = 'selected';
  static const disabledBackground = 'disabledBackground';
  static const focus = 'focus';
}

class ShadeColor extends ColorSwatch<String> {
  const ShadeColor(super.primary, super.swatch);

  /// The lightest shade.
  Color get lighter => this[_ShadeColorKeys.lighter]!;

  /// The second lightest shade.
  Color get light => this[_ShadeColorKeys.light]!;

  /// The default shade.
  Color get main => this[_ShadeColorKeys.main]!;

  /// The second darkest shade.
  Color get dark => this[_ShadeColorKeys.dark]!;

  /// The darkest shade.
  Color get darker => this[_ShadeColorKeys.darker]!;
}

class ShadeTextColor extends ColorSwatch<String> {
  const ShadeTextColor(super.primary, super.swatch);

  Color get primary => this[_ShadeColorKeys.primary]!;

  Color get secondary => this[_ShadeColorKeys.secondary]!;

  Color get disabled => this[_ShadeColorKeys.disabled]!;
}

class ShadeBackgroundColor extends ColorSwatch<String> {
  const ShadeBackgroundColor(super.primary, super.swatch);

  Color get defaults => this[_ShadeColorKeys.defaults]!;

  Color get paper => this[_ShadeColorKeys.paper]!;

  Color get neutral => this[_ShadeColorKeys.neutral]!;
}

class ShadeStateColor extends ColorSwatch<String> {
  const ShadeStateColor(super.primary, super.swatch);

  Color get active => this[_ShadeColorKeys.active]!;

  Color get hover => this[_ShadeColorKeys.hover]!;

  Color get selected => this[_ShadeColorKeys.selected]!;

  Color get disabled => this[_ShadeColorKeys.disabled]!;

  Color get disabledBackground => this[_ShadeColorKeys.disabledBackground]!;

  Color get focus => this[_ShadeColorKeys.focus]!;
}
