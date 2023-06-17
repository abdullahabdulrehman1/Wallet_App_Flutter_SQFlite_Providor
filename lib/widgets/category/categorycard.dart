import 'package:flutter/material.dart';
import 'package:wallet_app/screens/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.title),
      subtitle: Text('entries: ${category.entries}'),
      trailing: Text('PKR: ${category.totalAmount}'),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(category.icon),
      ),
    );
  }
}
