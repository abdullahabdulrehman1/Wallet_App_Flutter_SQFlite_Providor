import 'package:flutter/material.dart';
import 'package:wallet_app/screens/category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Category(),
      routes: {
        Category.name: (_) => const Category(),
      },
    );
  }
}
