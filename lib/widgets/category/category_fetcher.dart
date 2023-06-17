import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/widgets/category/categorylist.dart';

import '../../models/databaseprovidor.dart';

class CategoryFinder extends StatefulWidget {
  const CategoryFinder({super.key});

  @override
  State<CategoryFinder> createState() => _CategoryFinderState();
}

class _CategoryFinderState extends State<CategoryFinder> {
  late Future _categoryList;
  Future _getCategoryList() async {
    final provider = Provider.of<DatanaseProvidor>(context, listen: false);
    return await provider.fetchCategroies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryList = _getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoryList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            // Add the return statement here
            return CategoryList();

            // "YourWidget" with the appropriate widget
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
