import 'dart:io';
import 'package:expense_manager/models/transaction.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  static final  String databaseName = 'ExpensesManager.db';
  // Transactions Table Constance's
  static final String transactionTableName = 'Transaction';
  static final String columnTransactionName = 'transactionName';
  static final String columnTransactionID = 'transactionID';
  static final String columnTransactionDate = 'transactionDate';
  static final String columnTransactionValue = 'transactionValue';
  static final String columnTransactionCategory = 'transactionCategory';
  // Categories Table Constance's
  static final String categoriesTableName = 'Categories';
  static final String columnCategoryName = 'categoryName';
  static final String columnCategoryImage = 'categoryImage';

  Database database;

  Future<Database> initDatabase() async {
    if (database != null) {
      return database;
    } else {
      database = await createConnectionWithDatabase();
      return database;
    }
}
  Future<Database> createConnectionWithDatabase() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String dbPath = appDocPath + '/$databaseName';
      Database database =
      await openDatabase(dbPath, version: 1, onCreate: (database, v) {
        createTransactionTable(database);
        createCategoryTable(database);
      });
      return database;
    } catch (e) {
      return null;
    }
  }

  createTransactionTable(Database database) async {
    database.execute(
        '''CREATE TABLE $transactionTableName
        ($columnTransactionID INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTransactionName TEXT PRIMARY KEY,
        $columnTransactionDate TEXT,
        $columnTransactionValue DOUBLE,
        $columnTransactionCategory TEXT,
        FOREIGN KEY ($columnTransactionCategory) REFERENCES $categoriesTableName($columnCategoryName) ON DELETE CASCADE )''');
  }


  createCategoryTable(Database database) async {
    database.execute(
        'CREATE TABLE $categoriesTableName ($columnCategoryName TEXT PRIMARY KEY, $columnCategoryImage TEXT)');
  }

  insertTransaction(MyTransaction transaction) async {
    try {
      Database database = await initDatabase();
      await database.insert(transactionTableName, transaction.toJson());
    } catch (e) {}
  }

}