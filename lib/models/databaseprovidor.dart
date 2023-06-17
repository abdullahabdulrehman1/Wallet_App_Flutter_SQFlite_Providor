import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wallet_app/models/categorymodel.dart';
import 'package:wallet_app/screens/category.dart';

import '../constants/icons.dart';

class DatanaseProvidor with ChangeNotifier {
  List<ExpenseCategory> _categories = [];
  List<ExpenseCategory> get Category => [];
  Database? _database;
  Future<Database> get database async {
    final dbDirectory = await getDatabasesPath();
    const dbname = 'expense_tc.db';
    final path = join(dbDirectory, dbname);
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _CreateDB,
    );
    return _database!;
  }

  static const ctable = 'categorytable';
  static const etable = 'expensetable';
  Future<void> _CreateDB(Database db, int version) async {
    //this will run only once when the databse started
    await db.transaction((txn) async {
      // category table
      await txn.execute('''CREATE TABLE $ctable(
        title TEXT,
        entries INTEGER,
        totalAmount TEXT
      )''');
      // expense table
      await txn.execute('''CREATE TABLE $etable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount TEXT,
        date TEXT,
        category TEXT
      )''');
      for (int i = 0; i < icons.length; i++) {
        await txn.insert(ctable, {
          'title': icons.keys.toList()[i],
          'entries': 0,
          'totalAmount': (0.0).toString(),
        });
      }
    });
  }

//method t o fetch categories

  Future<List<ExpenseCategory>> fetchCategroies() async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(ctable).then((value) {
        final converted = List<Map<String, dynamic>>.from(value);
        List<ExpenseCategory> nlist = List.generate(converted.length,
            (index) => ExpenseCategory.fromMap(converted[index]));
        _categories = nlist;
        return _categories;
      });
    });
  }
}
