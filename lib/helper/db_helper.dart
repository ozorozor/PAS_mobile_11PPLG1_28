import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;
  static const String tableName = 'favorites';

  static Future<Database> initDB() async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY,
            title TEXT,
            price REAL,
            description TEXT,
            category TEXT,
            image TEXT
          )
        ''');
      },
    );

    return _database!;
  }

  static Future<int> addFavorite(Map<String, dynamic> product) async {
    final db = await initDB();
    return await db.insert(
      tableName,
      product,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await initDB();
    return await db.query(tableName);
  }

  static Future<int> deleteFavorite(int id) async {
    final db = await initDB();
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}