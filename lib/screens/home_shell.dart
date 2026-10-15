import 'package:flutter/material.dart';
import 'basics_screen.dart';
import 'lists_screen.dart';
import 'nav_screen.dart';
import 'stack_screen.dart';
import 'style_screen.dart';

/// Главный экран: боковое меню (Drawer), разделы лежат в IndexedStack.
class HomeShell extends StatefulWidget {
  final ThemeMode mode;
  final ValueChanged<ThemeMode> onMode;

  const HomeShell({super.key, required this.mode, required this.onMode});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const _items = [
    (Icons.widgets_outlined, 'Основы', 'Уроки 3-6'),
    (Icons.view_list_outlined, 'Списки', 'Уроки 7-9'),
    (Icons.layers_outlined, 'Слои', 'Урок 10'),
    (Icons.palette_outlined, 'Стиль', 'Уроки 11-13'),
    (Icons.alt_route, 'Навигация', 'Уроки 14-15'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Кофейня · ${_items[_index].$2}')),
      drawer: NavigationDrawer(
        selectedIndex: _index,
        onDestinationSelected: (i) {
          setState(() => _index = i);
          Navigator.pop(context); // закрыть Drawer
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 24, 16, 12),
            child: Text('Pro Flutter', style: Theme.of(context).textTheme.titleLarge),
          ),
          for (final it in _items)
            NavigationDrawerDestination(
              icon: Icon(it.$1),
              label: Text('${it.$2}  ·  ${it.$3}'),
            ),
        ],
      ),
      body: IndexedStack(
        index: _index,
        children: [
          const BasicsScreen(),
          const ListsScreen(),
          const StackScreen(),
          StyleScreen(mode: widget.mode, onMode: widget.onMode),
          const NavScreen(),
        ],
      ),
    );
  }
}
