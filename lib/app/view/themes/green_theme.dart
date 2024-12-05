import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade package to version 8.0.2.
///
/// Use in [MaterialApp] like this:
///
/// MaterialApp(
///  theme: AppTheme.light,
///  darkTheme: AppTheme.dark,
///  :
/// );
sealed class GreenTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xFF065808),
    primaryContainer: Color(0xFF9EE29F),
    primaryLightRef: Color(0xFF065808),
    secondary: Color(0xFF365B37),
    secondaryContainer: Color(0xFFAEBDAF),
    secondaryLightRef: Color(0xFF365B37),
    tertiary: Color(0xFF2C7E2E),
    tertiaryContainer: Color(0xFFB8E6B9),
    tertiaryLightRef: Color(0xFF2C7E2E),
    appBarColor: Color(0xFFB8E6B9),
    error: Color(0xFFB00020),
    errorContainer: Color(0xFFFCD8DF),
  ),
  subThemesData: const FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    useM2StyleDividerInM3: true,
    inputDecoratorIsFilled: true,
    inputDecoratorBorderType: FlexInputBorderType.outline,
    alignedDropdown: true,
    navigationRailUseIndicator: true,
    navigationRailLabelType: NavigationRailLabelType.all,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xFF629F80),
    primaryContainer: Color(0xFF274033),
    primaryLightRef: Color(0xFF065808),
    secondary: Color(0xFF81B39A),
    secondaryContainer: Color(0xFF4D6B5C),
    secondaryLightRef: Color(0xFF365B37),
    tertiary: Color(0xFF88C5A6),
    tertiaryContainer: Color(0xFF356C50),
    tertiaryLightRef: Color(0xFF2C7E2E),
    appBarColor: Color(0xFF356C50),
    error: Color(0xFFCF6679),
    errorContainer: Color(0xFFB1384E),
  ),
  subThemesData: const FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    blendOnColors: true,
    useM2StyleDividerInM3: true,
    inputDecoratorIsFilled: true,
    inputDecoratorBorderType: FlexInputBorderType.outline,
    alignedDropdown: true,
    navigationRailUseIndicator: true,
    navigationRailLabelType: NavigationRailLabelType.all,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
