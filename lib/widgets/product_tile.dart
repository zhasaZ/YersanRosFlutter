import 'package:flutter/material.dart';
import '../data/menu_data.dart';

/// Урок 3: StatelessWidget - данные приходят снаружи, состояния нет.
class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductTile({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: scheme.secondaryContainer,
        child: Icon(product.icon, color: scheme.onSecondaryContainer),
      ),
      title: Text(product.name),
      subtitle: Text(product.category),
      trailing: Text('\$${product.price.toStringAsFixed(2)}'),
    );
  }
}
