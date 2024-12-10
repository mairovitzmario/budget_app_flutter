import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/category.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('categories.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        color TEXT NOT NULL,
        items TEXT NOT NULL -- Stores items as a JSON string
      );
    ''');
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }

  Future<int> addCategory(Category category) async {
    final db = await instance.database;
    return await db.insert('Categories', category.toMap());
  }

  Future<List<Category>> fetchCategories() async {
    final db = await instance.database;
    final result = await db.query('Categories');

    return result.map((e) => Category.fromMap(e)).toList();
  }

  Future<int> updateCategory(Category category) async {
    final db = await instance.database;
    return await db.update(
      'Categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final db = await instance.database;
    return await db.delete(
      'Categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
