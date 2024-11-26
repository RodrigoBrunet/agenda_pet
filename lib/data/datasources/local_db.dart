import 'package:agenda_pet/data/models/appointment_model.dart';
import 'package:agenda_pet/data/models/pet_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDB {
  static final LocalDB _instance = LocalDB._internal();

  factory LocalDB() {
    return _instance;
  }

  LocalDB._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'pet_grooming.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE pets ( 
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT, 
      breed TEXT 
      ) 
    ''');

    await db.execute(''' 
    CREATE TABLE appointments (
       id INTEGER PRIMARY KEY AUTOINCREMENT, 
       pet_id INTEGER, 
       date TEXT, 
       service TEXT, 
       FOREIGN KEY (pet_id) REFERENCES pets (id) 
       ) 
    ''');
  }

  Future<int> insertPet(PetModel pet) async {
    final db = await database;
    return await db.insert('pets', pet.toMap());
  }

  Future<int> insertAppointment(AppointmentModel appointment) async {
    final db = await database;
    return await db.insert('appointments', appointment.toMap());
  }

  Future<List<PetModel>> getPets() async {
    final db = await database;
    final res = await db.query('pets');
    return res.map((e) => PetModel.fromMap(e)).toList();
  }

  Future<List<AppointmentModel>> getAppointments() async {
    final db = await database;
    final res = await db.query('appointments');
    return res.map((e) => AppointmentModel.fromMap(e)).toList();
  }
}
