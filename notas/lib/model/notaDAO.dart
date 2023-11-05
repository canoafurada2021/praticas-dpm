import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:notas/model/nota.dart';

class DBHelper {
  final String tableName = 'notes';
  late Database _db;

  Future<void> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'notes.db');

    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE $tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT
        )
      ''');
    });
  }

  Future<int> insertNota(Nota nota) async {
    await initializeDatabase();
    return await _db.insert(tableName, nota.toMap());
  }

  Future<List<Nota>> getNotas() async {
    await initializeDatabase();
    final List<Map<String, dynamic>> maps = await _db.query(tableName);
    return List.generate(maps.length, (i) {
      return Nota(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
    });
  }

  Future<int> updateNota(Nota nota) {
    return _db.update(
      tableName,
      nota.toMap(),
      where: 'id = ?',
      whereArgs: [nota.id],
    );
  }

  void deleteNota(int id) {
    _db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
