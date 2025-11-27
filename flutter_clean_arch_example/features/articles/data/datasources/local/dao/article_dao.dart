import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ArticleDao {
  final AppDatabase _db;
  ArticleDao(this._db);

  Future<void> insert(Map<String, dynamic> json) async {
    final db = await _db.database;
    await db.insert('articles', json, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertMany(List<Map<String, dynamic>> rows) async {
    final db = await _db.database;
    final batch = db.batch();
    for (final row in rows) {
      batch.insert('articles', row, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await _db.database;
    return db.query('articles', orderBy: 'id DESC');
  }

  Future<void> clear() async {
    final db = await _db.database;
    await db.delete('articles');
  }
}
