import 'package:kalkulator_potrosnje/database/kalkulator_potrosnje_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get getPath async {
    return p.join(await getDatabasesPath(), "kalkulator_potrosnje.db");
  }

  Future<Database> _initialize() async {
    return await openDatabase(await getPath, onConfigure: createDatabase, version: 1);
  }

  Future<void> createDatabase(Database db) async {
    await KalkulatorPotrosnjeDB().createTable(db);
  }
}
