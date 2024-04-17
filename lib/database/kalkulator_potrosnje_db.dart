import 'package:kalkulator_potrosnje/database/database_service.dart';
import 'package:kalkulator_potrosnje/models/vehicle.dart';
import 'package:sqflite/sqflite.dart';

class KalkulatorPotrosnjeDB {
  Future<void> createTable(Database db) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS Vehicles(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name VARCHAR(255) NOT NULL, fuelType INTEGER, averageFuelConsumption DOUBLE)");
  }

  Future<void> addVehicle(Vehicle v) async {
    final db = await DatabaseService().database;
    await db.insert("Vehicles", v.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Vehicle>> getVehicles() async {
    final db = await DatabaseService().database;
    final List<Map<String, Object?>> vehicleMaps = await db.query('Vehicles');
    return vehicleMaps.map((i) => Vehicle.fromDB(i)).toList();
  }
}
