import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});
  static const name = '/catgory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categoryies"),
      ),
    );
  }
}
