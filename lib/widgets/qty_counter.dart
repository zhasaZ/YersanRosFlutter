import 'package:flutter/material.dart';

/// Урок 4: StatefulWidget - количество порций хранится в состоянии.
class QtyCounter extends StatefulWidget {
  final double price;
  const QtyCounter({super.key, required this.price});

  @override
  State<QtyCounter> createState() => _QtyCounterState();
}

class _QtyCounterState extends State<QtyCounter> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton.filledTonal(
              onPressed: _qty > 1 ? () => setState(() => _qty--) : null,
              icon: const Icon(Icons.remove),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('$_qty', style: Theme.of(context).textTheme.titleLarge),
            ),
            IconButton.filledTonal(
              onPressed: () => setState(() => _qty++),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        Text('Итого: \$${(widget.price * _qty).toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
