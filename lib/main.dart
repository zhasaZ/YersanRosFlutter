import 'package:flutter/material.dart';

import 'data/menu_data.dart';
import 'screens/home_shell.dart';
import 'screens/nav_screen.dart';
import 'theme/app_theme.dart';

// Уроки 1-2: main() -> runApp() -> дерево виджетов.
void main() => runApp(const CoffeeApp());

class CoffeeApp extends StatefulWidget {
  const CoffeeApp({super.key});

  @override
  State<CoffeeApp> createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp> {
  ThemeMode _mode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кофейня',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _mode,
      // Урок 14: именованные маршруты
      initialRoute: '/',
      routes: {
        '/': (_) => HomeShell(mode: _mode, onMode: (m) => setState(() => _mode = m)),
        '/info': (_) => const InfoPage(),
        '/args': (_) => const ArgsPage(),
      },
      // Урок 15: параметр внутри маршрута, например /product/3
      onGenerateRoute: (settings) {
        final name = settings.name ?? '';
        if (name.startsWith('/product/')) {
          final id = int.tryParse(name.substring('/product/'.length));
          final p = id == null ? null : productById(id);
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => p == null
                ? Scaffold(appBar: AppBar(), body: const Center(child: Text('Товар не найден')))
                : ProductPage(product: p),
          );
        }
        return null;
      },
    );
  }
}
