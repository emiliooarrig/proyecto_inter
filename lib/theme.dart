import 'package:flutter/material.dart';

class FiammaColors {
  static const background = Color(0xFF120D0B);
  static const surface = Color(0xFF1C1512);
  static const cream = Color(0xFFFDF4E7);
  static const flame = Color(0xFFFF6A1F);
}

final fiammaTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: FiammaColors.flame,
    surface: FiammaColors.background,
    onSurface: FiammaColors.cream,
  ),
  scaffoldBackgroundColor: FiammaColors.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: FiammaColors.background,
    foregroundColor: FiammaColors.cream,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: FiammaColors.cream,
      fontFamily: 'serif',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic,
    ),
  ),
  drawerTheme: const DrawerThemeData(backgroundColor: FiammaColors.surface),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: FiammaColors.surface,
    selectedItemColor: FiammaColors.flame,
    unselectedItemColor: FiammaColors.cream.withValues(alpha: 0.45),
    type: BottomNavigationBarType.fixed,
    elevation: 0,
    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
  ),
);
