# Pro Flutter v3 - «Кофейня»

Все темы курса (уроки 1-15) собраны в одном приложении с боковым меню (Drawer)
и темой «кофейня»: коричневая цветовая схема, Montserrat, светлая/тёмная/авто тема.

## Запуск
1. Откройте папку YersanRosFlutter в Android Studio / VS Code.
2. `flutter create .`   (создаст android/ios/web/windows, файлы lib и assets не тронет)
3. `flutter pub get`
4. `flutter run`

## Где что
| Раздел | Уроки | Файл |
|---|---|---|
| Основы | 3 Stateless, 4 Stateful, 5 Container, 6 Column/Row | screens/basics_screen.dart, widgets/ |
| Списки | 7 ListView, 8 GridView, 9 PageView | screens/lists_screen.dart |
| Слои | 10 Stack, Positioned, IndexedStack | screens/stack_screen.dart (+ IndexedStack в home_shell.dart) |
| Стиль | 11 шрифты, 12 картинки/SVG, 13 тема | screens/style_screen.dart, theme/app_theme.dart |
| Навигация | 14 маршруты, 15 параметры | screens/nav_screen.dart, main.dart |

Уроки 16-17 (desktop и web, Firebase, GitHub Actions): `flutter build windows` / `flutter build web`,
хостинг и CI настраиваются в своём аккаунте.
