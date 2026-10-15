import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Урок 13: собственная тема. Цвета кофейни + своё расширение темы.
@immutable
class CoffeeColors extends ThemeExtension<CoffeeColors> {
  final Color foam;
  final Color crema;

  const CoffeeColors({required this.foam, required this.crema});

  @override
  CoffeeColors copyWith({Color? foam, Color? crema}) =>
      CoffeeColors(foam: foam ?? this.foam, crema: crema ?? this.crema);

  @override
  CoffeeColors lerp(ThemeExtension<CoffeeColors>? other, double t) {
    if (other is! CoffeeColors) return this;
    return CoffeeColors(
      foam: Color.lerp(foam, other.foam, t)!,
      crema: Color.lerp(crema, other.crema, t)!,
    );
  }
}

class AppTheme {
  static const _seed = Color(0xFF6F4E37); // цвет кофе

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness b) {
    final scheme = ColorScheme.fromSeed(seedColor: _seed, brightness: b);
    final isLight = b == Brightness.light;
    return ThemeData(
      useMaterial3: true,
      brightness: b,
      colorScheme: scheme,
      // Урок 11: шрифт для всего приложения
      textTheme: GoogleFonts.montserratTextTheme(ThemeData(brightness: b).textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primaryContainer,
        foregroundColor: scheme.onPrimaryContainer,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
      extensions: [
        CoffeeColors(
          foam: isLight ? const Color(0xFFF5EBDD) : const Color(0xFF3B2F28),
          crema: isLight ? const Color(0xFFC69C6D) : const Color(0xFF8A6A47),
        ),
      ],
    );
  }
}
