import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/icons.dart';

class DatanaseProvidor {
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
}
