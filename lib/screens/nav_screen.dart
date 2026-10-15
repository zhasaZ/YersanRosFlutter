import 'package:flutter/material.dart';
import '../data/menu_data.dart';
import '../widgets/section_card.dart';

/// Уроки 14-15: push, pop, pushNamed, параметры тремя способами.
class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          lesson: 'Урок 14',
          title: 'Анонимные и именованные маршруты',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InfoPage()),
                ),
                child: const Text('push'),
              ),
              FilledButton.tonal(
                onPressed: () => Navigator.pushNamed(context, '/info'),
                child: const Text('pushNamed /info'),
              ),
            ],
          ),
        ),
        SectionCard(
          lesson: 'Урок 15',
          title: 'Передача параметров',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              // 1) в конструктор
              FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductPage(product: products[1])),
                ),
                child: const Text('Конструктор'),
              ),
              // 2) через arguments
              FilledButton.tonal(
                onPressed: () => Navigator.pushNamed(context, '/args', arguments: products[2]),
                child: const Text('arguments'),
              ),
              // 3) прямо в маршруте
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/product/6'),
                child: const Text('/product/6'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('О кофейне')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Работаем с 8:00 до 22:00'),
            const SizedBox(height: 16),
            FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Назад (pop)')),
          ],
        ),
      ),
    );
  }
}

/// Получает товар через конструктор.
class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: scheme.primaryContainer,
              child: Icon(product.icon, size: 50, color: scheme.onPrimaryContainer),
            ),
            const SizedBox(height: 16),
            Text(product.description),
            const SizedBox(height: 8),
            Text('\$${product.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Назад')),
          ],
        ),
      ),
    );
  }
}

/// Получает товар через settings.arguments.
class ArgsPage extends StatelessWidget {
  const ArgsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final p = ModalRoute.of(context)!.settings.arguments as Product?;
    if (p == null) {
      return Scaffold(appBar: AppBar(title: const Text('arguments')), body: const Center(child: Text('Нет данных')));
    }
    return ProductPage(product: p);
  }
}
