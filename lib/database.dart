import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const _version = 1;
  static const _schema = 'ready_or_not.db';
  static final DatabaseProvider db = DatabaseProvider._();
  Database _database;

  DatabaseProvider._();

  static const _createCurrencySql = '''
  CREATE TABLE IF NOT EXISTS Currencies (
    name TEXT PRIMARY KEY,
    type INTEGER NOT NULL,
    exchange_rate REAL NULL,
  ) [WITHOUT ROWID];
  ''';

  static const _createAccountSql = '''
    CREATE TABLE IF NOT EXISTS Accounts (
    name TEXT PRIMARY KEY,
    amount REAL NOT NULL,
    enabled INTEGER NOT NULL,
    Currencies_name Text NOT NULL,
    memo TEXT NULL,
    FOREIGN KEY (Currencies_name)
    REFERENCES Currencies(name)
      ON UPDATE NO ACTION 
      ON DELETE NO ACTION;
  ) [WITHOUT ROWID];
  ''';

  Future<Database> get open async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }

  Future<Database> init() async {
    var path = await getDatabasesPath();
    var fullPath = join(path, _schema);
    return await openDatabase(fullPath, version: _version, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(_createCurrencySql);
    await db.execute(_createAccountSql);
  }
}
