import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Color palette modes
enum PaletteMode {
  gbc, // GameBoy Color - 4 shades of green
  gba, // GameBoy Advance - Enhanced colors
}

/// Manages visual theme and color palettes
class ThemeManager extends ChangeNotifier {
  PaletteMode _paletteMode = PaletteMode.gbc;
  
  PaletteMode get paletteMode => _paletteMode;
  
  void setPaletteMode(PaletteMode mode) {
    _paletteMode = mode;
    notifyListeners();
  }
  
  void togglePaletteMode() {
    _paletteMode = _paletteMode == PaletteMode.gbc 
        ? PaletteMode.gba 
        : PaletteMode.gbc;
    notifyListeners();
  }
  
  // GBC Palette (Original Green)
  static const Color gbcDarkest = Color(0xFF0f380f);
  static const Color gbcDark = Color(0xFF306230);
  static const Color gbcLight = Color(0xFF8bac0f);
  static const Color gbcLightest = Color(0xFF9bbc0f);
  
  // GBA Palette (Enhanced Colors)
  static const Color gbaBackground = Color(0xFF1a1a2e);
  static const Color gbaDark = Color(0xFF16213e);
  static const Color gbaAccent = Color(0xFF0f4c75);
  static const Color gbaHighlight = Color(0xFF3282b8);
  static const Color gbaText = Color(0xFFbbe1fa);
  
  // Contextual colors that adapt to palette
  Color get darkest => _paletteMode == PaletteMode.gbc ? gbcDarkest : gbaBackground;
  Color get dark => _paletteMode == PaletteMode.gbc ? gbcDark : gbaDark;
  Color get light => _paletteMode == PaletteMode.gbc ? gbcLight : gbaAccent;
  Color get lightest => _paletteMode == PaletteMode.gbc ? gbcLightest : gbaHighlight;
  Color get text => _paletteMode == PaletteMode.gbc ? gbcLightest : gbaText;
  
  // Special colors (consistent across palettes)
  static const Color hpRed = Color(0xFFFF4444);
  static const Color mpBlue = Color(0xFF4444FF);
  static const Color ppPurple = Color(0xFFBB44FF); // For Psynergy Points
  static const Color gold = Color(0xFFFFD700);
  
  // Elemental colors for Psynergy
  static const Color elementVenus = Color(0xFFFFD700); // Earth/Yellow
  static const Color elementMars = Color(0xFFFF4444); // Fire/Red
  static const Color elementJupiter = Color(0xFFBB44FF); // Wind/Purple
  static const Color elementMercury = Color(0xFF4444FF); // Water/Blue
  
  ThemeData buildTheme() {
    return ThemeData(
      primaryColor: dark,
      scaffoldBackgroundColor: darkest,
      colorScheme: ColorScheme.dark(
        primary: dark,
        secondary: light,
        surface: darkest,
        background: darkest,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: text,
          fontFamily: 'monospace',
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: text,
          fontFamily: 'monospace',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: light,
          fontFamily: 'monospace',
        ),
      ),
      useMaterial3: true,
    );
  }
  
  /// Get current palette as a map for easy access in widgets
  Map<String, Color> get currentPalette {
    return {
      'background': darkest,
      'primaryDark': darkest,
      'primary': dark,
      'secondary': light,
      'accent': lightest,
      'text': text,
      'hpColor': hpRed,
      'mpColor': mpBlue,
      'ppColor': ppPurple,
      'gold': gold,
      'elementVenus': elementVenus,
      'elementMars': elementMars,
      'elementJupiter': elementJupiter,
      'elementMercury': elementMercury,
    };
  }
}
