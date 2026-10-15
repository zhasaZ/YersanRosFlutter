import 'package:flutter/material.dart';
import '../data/menu_data.dart';
import '../theme/app_theme.dart';
import '../widgets/product_tile.dart';
import '../widgets/qty_counter.dart';
import '../widgets/section_card.dart';

/// Уроки 3-6: Stateless, Stateful, Container, Column/Row.
class BasicsScreen extends StatelessWidget {
  const BasicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final coffee = Theme.of(context).extension<CoffeeColors>()!;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionCard(
          lesson: 'Урок 3',
          title: 'Stateless виджет',
          child: ProductTile(product: Product(
            id: 0, name: 'Кофе дня', category: 'Акция', price: 1.5,
            icon: Icons.star, description: '',
          )),
        ),
        const SectionCard(
          lesson: 'Урок 4',
          title: 'Stateful виджет',
          child: QtyCounter(price: 2.6),
        ),
        SectionCard(
          lesson: 'Урок 5',
          title: 'Container и BoxDecoration',
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [scheme.primary, coffee.crema]),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: scheme.primaryContainer, width: 3),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6)),
              ],
            ),
            child: Text(
              'Второй кофе в подарок!',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: scheme.onPrimary),
            ),
          ),
        ),
        SectionCard(
          lesson: 'Урок 6',
          title: 'Column и Row',
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Капучино x2'), Text('\$5.20')],
              ),
              const SizedBox(height: 6),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Круассан x1'), Text('\$2.20')],
              ),
              const Divider(),
              // Expanded с разными flex
              Row(
                children: [
                  Expanded(flex: 1, child: Container(height: 36, color: coffee.crema)),
                  Expanded(flex: 2, child: Container(height: 36, color: scheme.primary)),
                  Expanded(flex: 1, child: Container(height: 36, color: scheme.tertiary)),
                ],
              ),
              const SizedBox(height: 6),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.receipt_long), SizedBox(width: 8), Text('Итого: \$7.40')],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
