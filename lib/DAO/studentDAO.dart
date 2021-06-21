import 'package:sqflite/sqflite.dart';

class StudentDAO {
  static const _dataBaseName = "database.db";
  static const _tableName = "students";
  static late Database _db;

  static Future<Database> _getConnection() async {
    String dataBasesPath = await getDatabasesPath();
    String path = "$dataBasesPath $_dataBaseName";
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute(
            "CREATE TABLE $_tableName(registration INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT)");
      },
    );
    return database;
  }

  static Future<int> insertRecord(Map<String, dynamic> data) async {
    _db = await _getConnection();
    return await _db.insert(_tableName, data);
  }
}
