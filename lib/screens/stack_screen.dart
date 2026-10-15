import 'package:flutter/material.dart';
import '../widgets/section_card.dart';

/// Урок 10: Stack, Positioned, IndexedStack.
class StackScreen extends StatefulWidget {
  const StackScreen({super.key});

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  int _layer = 0;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          lesson: 'Урок 10',
          title: 'Stack + Positioned',
          child: SizedBox(
            height: 180,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(Icons.coffee, size: 90, color: scheme.onPrimaryContainer),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Chip(
                    label: const Text('NEW'),
                    backgroundColor: scheme.tertiary,
                    labelStyle: TextStyle(color: scheme.onTertiary),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(18)),
                    ),
                    child: const Text('Раф с лавандой', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
        SectionCard(
          lesson: 'Урок 10',
          title: 'IndexedStack (показывает один слой)',
          child: Column(
            children: [
              SegmentedButton<int>(
                segments: const [
                  ButtonSegment(value: 0, label: Text('Кофе')),
                  ButtonSegment(value: 1, label: Text('Чай')),
                  ButtonSegment(value: 2, label: Text('Десерт')),
                ],
                selected: {_layer},
                onSelectionChanged: (s) => setState(() => _layer = s.first),
              ),
              const SizedBox(height: 12),
              IndexedStack(
                index: _layer,
                children: const [
                  _Layer(icon: Icons.coffee, text: 'Слой 0: кофе'),
                  _Layer(icon: Icons.emoji_food_beverage, text: 'Слой 1: чай'),
                  _Layer(icon: Icons.cake, text: 'Слой 2: десерт'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Layer extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Layer({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon, size: 40), const SizedBox(width: 12), Text(text)],
    );
  }
}
