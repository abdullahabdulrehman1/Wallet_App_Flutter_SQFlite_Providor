import 'package:flutter/material.dart';

import '../widgets/category/category_fetcher.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  const Category({super.key});
  static const name = '/category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categoryies"),
      ),
      body: CategoryFinder(),
    );
  }
}
