import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:wallet_app/models/database_provider.dart';
import 'package:wallet_app/screens/category.dart';
import 'package:wallet_app/widgets/category/categorycard.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var list = db.categories;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) => CategoryCard(category: list[i]),
        );
      },
    );
  }
}
