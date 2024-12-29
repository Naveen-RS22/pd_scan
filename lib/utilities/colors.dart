import 'package:flutter/material.dart';

class QColors {
  // App theme colors
  // static const Color primary =Color(0xffFF8C00); // Enhanced blue
  // static const Color secondary = Color(0xFF007BFF); // Enhanced orange
  // static const Color accent = Color(0xffbcc0cc); // Soft complementary color to primary
  static const Color primary = Color(0xFFF04444); // Red
  static const Color secondary = Color(0xFFD93838); // Darker Red
  static const Color accent = Color(0xFFFF6B6B); // Light Red/Coral
  static const Color background = Color(0xFFFFE5E5); // Light Pinkish Beige
  static const Color background2 = Color(0xFFFFC7C7); // Soft Pink
// Light Beige
  // Text colors
  static const Color textPrimary = Color(0xFF333333); // Dark, readable text
  static const Color textSecondary = Color(0xFF6C757D); // Muted secondary text
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6); // Subtle light background
  static const Color dark = Color(0xFF272727); // Deep dark background
  static const Color primaryBackground = Color(0xFFF3F5FF); // Light blue-toned background

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6); // Consistent light container background
  static Color darkContainer = QColors.white.withOpacity(0.1); // Transparent dark container background

  // Button colors (Adjusted for consistency with theme)
  static const Color buttonPrimary = primary; // Match primary color for button
  static const Color buttonSecondary = secondary; // Match secondary color for button
  static const Color buttonDisabled = Color(0xFFC4C4C4); // Keep a lighter grey for disabled state

  // Border colors (Subtle borders for minimalistic UI)
  static const Color borderPrimary = Color(0xFFD9D9D9); // Light border for forms, inputs
  static const Color borderSecondary = Color(0xFFE6E6E6); // Even lighter for secondary elements

  // Error and validation colors (Retaining for accessibility)
  static const Color error = Color(0xFFD32F2F); // Bright red for errors
  static const Color success = Color(0xFF388E3C); // Green for success states
  static const Color warning = Color(0xFFFFFF00); // Orange for warnings
  static const Color info = Color(0xFF1976D2); // Blue for info messages

  // Neutral Shades (Ensuring consistency)
  static const Color black = Color(0xFF232323); // Near black for strong emphasis
  static const Color darkerGrey = Color(0xFF4F4F4F); // Dark grey for less prominent elements
  static const Color darkGrey = Color(0xFF939393); // Mid-tone grey for inactive elements
  static const Color grey = Color(0xFFE0E0E0); // Light grey for background separation
  static const Color softGrey = Color(0xFFF4F4F4); // Very light grey, nearly white
  static const Color lightGrey = Color(0xFFF9F9F9); // Almost white for subtle contrasts
  static const Color white = Color(0xFFFFFFFF); // Pure white for text or backgrounds
}
