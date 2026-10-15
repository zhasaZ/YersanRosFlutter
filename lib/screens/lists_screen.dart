import 'package:flutter/material.dart';
import '../data/menu_data.dart';
import '../widgets/product_tile.dart';

/// Уроки 7-9: ListView, GridView, PageView (каждый на своей вкладке).
class ListsScreen extends StatelessWidget {
  const ListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: const [
          TabBar(tabs: [
            Tab(text: 'ListView'),
            Tab(text: 'GridView'),
            Tab(text: 'PageView'),
          ]),
          Expanded(
            child: TabBarView(children: [_MenuList(), _CategoryGrid(), _Banners()]),
          ),
        ],
      ),
    );
  }
}

// Урок 7
class _MenuList extends StatelessWidget {
  const _MenuList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) => ProductTile(
        product: products[i],
        // Урок 15: параметр прямо в маршруте
        onTap: () => Navigator.pushNamed(context, '/product/${products[i].id}'),
      ),
    );
  }
}

// Урок 8
class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final entries = categories.entries.toList();
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        for (final e in entries)
          Container(
            decoration: BoxDecoration(
              color: scheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(e.value, size: 44, color: scheme.onSecondaryContainer),
                const SizedBox(height: 8),
                Text(e.key, style: TextStyle(color: scheme.onSecondaryContainer)),
              ],
            ),
          ),
      ],
    );
  }
}

// Урок 9
class _Banners extends StatefulWidget {
  const _Banners();

  @override
  State<_Banners> createState() => _BannersState();
}

class _BannersState extends State<_Banners> {
  final _controller = PageController(viewportFraction: 0.85);
  int _page = 0;

  static const _texts = ['Утренний комбо -20%', 'Счастливые часы 15-17', 'Новый сезонный латте'];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = [scheme.primary, scheme.tertiary, scheme.secondary];
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: _texts.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (_, i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
              decoration: BoxDecoration(
                color: colors[i],
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: Text(_texts[i],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < _texts.length; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.all(4),
                width: i == _page ? 22 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: i == _page ? scheme.primary : scheme.outlineVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
