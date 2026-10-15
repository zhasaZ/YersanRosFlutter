import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/section_card.dart';

/// Уроки 11-13: шрифты, картинки, тема.
class StyleScreen extends StatelessWidget {
  final ThemeMode mode;
  final ValueChanged<ThemeMode> onMode;

  const StyleScreen({super.key, required this.mode, required this.onMode});

  static const _svg = '''
<svg width="100" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="44" fill="#C69C6D"/>
  <circle cx="50" cy="50" r="30" fill="#6F4E37"/>
  <path d="M38 38 q12 12 0 24" fill="none" stroke="#F5EBDD" stroke-width="5" stroke-linecap="round"/>
</svg>''';

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final coffee = Theme.of(context).extension<CoffeeColors>()!;
    final swatches = <String, Color>{
      'primary': scheme.primary,
      'secondary': scheme.secondary,
      'tertiary': scheme.tertiary,
      'foam': coffee.foam,
      'crema': coffee.crema,
    };

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          lesson: 'Урок 11',
          title: 'Шрифты (google_fonts)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Playfair Display', style: GoogleFonts.playfairDisplay(fontSize: 26)),
              Text('Pacifico', style: GoogleFonts.pacifico(fontSize: 24)),
              Text('Fira Code: latte();', style: GoogleFonts.firaCode(fontSize: 18)),
            ],
          ),
        ),
        SectionCard(
          lesson: 'Урок 12',
          title: 'Картинки: network, asset, SVG',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Image.asset'),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/beans.png', height: 100, width: double.infinity, fit: BoxFit.cover),
              ),
              const SizedBox(height: 12),
              const Text('Image.network'),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/400/160',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, child, p) =>
                      p == null ? child : const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
                  errorBuilder: (_, __, ___) =>
                      const SizedBox(height: 100, child: Center(child: Text('Нет интернета'))),
                ),
              ),
              const SizedBox(height: 12),
              const Text('SVG: string и asset'),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.string(_svg, width: 80, height: 80),
                  SvgPicture.asset('assets/images/cup.svg', width: 80, height: 80),
                ],
              ),
            ],
          ),
        ),
        SectionCard(
          lesson: 'Урок 13',
          title: 'Тема приложения',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SegmentedButton<ThemeMode>(
                segments: const [
                  ButtonSegment(value: ThemeMode.system, label: Text('Авто'), icon: Icon(Icons.brightness_auto)),
                  ButtonSegment(value: ThemeMode.light, label: Text('Светлая'), icon: Icon(Icons.light_mode)),
                  ButtonSegment(value: ThemeMode.dark, label: Text('Тёмная'), icon: Icon(Icons.dark_mode)),
                ],
                selected: {mode},
                onSelectionChanged: (s) => onMode(s.first),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  for (final e in swatches.entries)
                    Chip(avatar: CircleAvatar(backgroundColor: e.value), label: Text(e.key)),
                ],
              ),
              const SizedBox(height: 12),
              FilledButton(onPressed: () {}, child: const Text('Кнопка из темы')),
            ],
          ),
        ),
      ],
    );
  }
}
