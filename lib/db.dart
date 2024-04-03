import 'package:Careme/appointments.dart';
import 'package:Careme/pages/vital_sign.dart';
import 'package:Careme/users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Medical_care_app.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE appointments(
        id INTEGER,
        docFirstName TEXT,
        docLastName TEXT,
        specialty TEXT,
        selectedTime TEXT,
        selectedDate TEXT,
        appointmentNo INTEGER PRIMARY KEY AUTOINCREMENT
      )
    ''');
    await db.execute('''
      CREATE TABLE vitalSign(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        weight INTEGER,
        height INTEGER,
        heartRate INTEGER,
        bloodSugar INTEGER,
        bloodPressure INTEGER,
        bloodType TEXT,
        cholesterolLevels INTEGER 
      )
    ''');
    await db.execute('''
      CREATE TABLE users(
        nationalId INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT,
        lastName TEXT,
        gender TEXT,
        phoneNo TEXT,
        email TEXT,
        pass TEXT
      )
    ''');
  }

  // Insert a new appointment into the database
  Future<int> insertAppointment(Appointment appointment) async {
    Database db = await database;
    return await db.insert(
      'appointments',
      appointment.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> insertVitalSign(VitalSign vitalSign) async {
    Database db = await database;
    return await db.insert(
      'vitalSign',
      vitalSign.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> insertUser(User user) async {
    Database db = await database;
    return await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  // Retrieve all appointments from the database
  Future<List<Appointment>> getAppointments() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('appointments');
    return List.generate(maps.length, (index) {
      return Appointment.fromMap(maps[index]);
    });
  }

  Future<List<User>> getUsers() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (index) {
      return User.fromMap(maps[index]);
    });
  }

  Future<List<Appointment>> getAppointmentsById(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'appointments',
      where: 'id = ?',
      whereArgs: [id],
    );
    List<Appointment> appointments = [];

    if (maps.isNotEmpty) {
      appointments = maps.map((map) => Appointment.fromMap(map)).toList();
    }

    return appointments;
  }

  Future<VitalSign?> getVitalSignById(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'vitalSign',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return VitalSign.fromMap(maps.first);
    }
    return null;
  }

  Future<User?> getUserById(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'nationalId = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<User?> getUserByEmail(String email) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<User?> getUserByEmailAndPassword(String email, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ? AND pass = ?',
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateAppointment(Appointment appointment) async {
    Database db = await database;
    return await db.update('appointments', appointment.toMap(),
        where: 'id = ?', whereArgs: [appointment.id]);
  }

  Future<int> updateVitalSign(VitalSign vitalSign) async {
    Database db = await database;
    return await db.update('vitalSign', vitalSign.toMap(),
        where: 'id = ?', whereArgs: [vitalSign.id]);
  }

  Future<int> updateUser(User user) async {
    Database db = await database;
    return await db.update('users', user.toMap(),
        where: 'nationalId = ?', whereArgs: [user.nationalId]);
  }

  // Delete an appointment from the database
  Future<int> deleteAppointment(int appointmentNo) async {
    Database db = await database;
    return await db.delete('appointments',
        where: 'appointmentNo = ?', whereArgs: [appointmentNo]);
  }

  Future<int> deleteVitalSign(int id) async {
    Database db = await database;
    return await db.delete('vitalSign', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteUser(int id) async {
    Database db = await database;
    return await db.delete('users', where: 'nationalId = ?', whereArgs: [id]);
  }
}
