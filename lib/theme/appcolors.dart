import 'package:flutter/material.dart';

class AppColors {
  // This class is not meant to be instantiated.
  AppColors._();

  /// --- Brand / Appetizing Accents ---
  // A vibrant, warm orange-red that triggers appetite. Perfect for buttons, active states, and highlights.
  static const Color primary = Color((0xFFFF5A36)); 
  
  // A bright, sunny gold/amber for ratings, cooking difficulty tags, or premium features.
  static const Color accentGold = Color((0xFFFFB800)); 
  
  // A fresh, herbaceous green for healthy, vegan, or organic categories.
  static const Color freshGreen = Color((0xFF2ECC71)); 

  /// --- Light Mode Surfaces (Fresh & Creamy) ---
  // A warm, soft bone-white/cream instead of stark #FFFFFF. Keeps the app feeling cozy.
  static const Color background = Color((0xFFFDFBF7)); 
  
  // Slightly cooler, ultra-light "ghost" grey-blue for card backgrounds, input fields, and search bars.
  static const Color surface = Color((0xFFF4F6F8)); 

  /// --- Dark Mode / Deep Elements ---
  // A rich, deep midnight navy for text, app bars, or dark mode background if needed.
  static const Color textDark = Color((0xFF0F172A)); 
  
  // A softer grey for secondary text, subtitles, and captions (e.g., "15 mins • Easy").
  static const Color textMuted = Color((0xFF64748B)); 

  /// --- Utility Colors ---
  // Borders, dividers, and subtle lines.
  static const Color border = Color((0xFFE2E8F0)); 
  static const Color white = Color((0xFFFFFFFF));
  static const Color black = Color((0xFF000000));

  /// --- Gradients ---
  // Beautiful overlay gradient for food image cards so white text stays readable.
  static const Gradient foodImageOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color(0x99000000), // Soft black shadow at the bottom
    ],
  );

  // A vibrant brand gradient for eye-catching banners or primary buttons.
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF7E40),
      Color(0xFFFF5A36),
    ],
  );
}