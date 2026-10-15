import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final IconData icon;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
    required this.description,
  });
}

const products = <Product>[
  Product(id: 1, name: 'Эспрессо', category: 'Кофе', price: 1.8, icon: Icons.coffee, description: 'Крепкий и насыщенный, 30 мл.'),
  Product(id: 2, name: 'Капучино', category: 'Кофе', price: 2.6, icon: Icons.coffee_maker, description: 'Эспрессо, молоко и плотная пенка.'),
  Product(id: 3, name: 'Латте', category: 'Кофе', price: 2.9, icon: Icons.local_cafe, description: 'Нежный вкус, много молока.'),
  Product(id: 4, name: 'Зелёный чай', category: 'Чай', price: 1.9, icon: Icons.emoji_food_beverage, description: 'Лёгкий, с жасмином.'),
  Product(id: 5, name: 'Круассан', category: 'Выпечка', price: 2.2, icon: Icons.bakery_dining, description: 'Свежий, с маслом.'),
  Product(id: 6, name: 'Чизкейк', category: 'Десерты', price: 3.4, icon: Icons.cake, description: 'Классический нью-йоркский.'),
  Product(id: 7, name: 'Лимонад', category: 'Холодное', price: 2.5, icon: Icons.local_drink, description: 'Лимон, мята, лёд.'),
  Product(id: 8, name: 'Сэндвич', category: 'Выпечка', price: 3.8, icon: Icons.lunch_dining, description: 'С курицей и сыром.'),
];

const categories = <String, IconData>{
  'Кофе': Icons.coffee,
  'Чай': Icons.emoji_food_beverage,
  'Выпечка': Icons.bakery_dining,
  'Десерты': Icons.cake,
  'Холодное': Icons.local_drink,
  'Завтраки': Icons.breakfast_dining,
};

Product? productById(int id) {
  for (final p in products) {
    if (p.id == id) return p;
  }
  return null;
}
