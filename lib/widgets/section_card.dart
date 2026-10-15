import 'package:flutter/material.dart';

/// Карточка-раздел с заголовком: переиспользуется на всех экранах.
class SectionCard extends StatelessWidget {
  final String lesson;
  final String title;
  final Widget child;

  const SectionCard({super.key, required this.lesson, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(label: Text(lesson), visualDensity: VisualDensity.compact),
            const SizedBox(height: 6),
            Text(title, style: t.textTheme.titleMedium),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
