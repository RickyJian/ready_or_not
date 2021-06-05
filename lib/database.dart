import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const _version = 1;
  static final DatabaseProvider db = DatabaseProvider._();
  Database _database;

  DatabaseProvider._();

  Future<Database> get open async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }

  Future<Database> init() async {
    var path = await getDatabasesPath();
    var fullPath = join(path, 'ready_or_not.db');
    return await openDatabase(fullPath, version: _version, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    // TODO:create table
  }
}
