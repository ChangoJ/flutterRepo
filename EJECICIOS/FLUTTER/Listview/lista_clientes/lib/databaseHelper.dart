import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'product.dart';

class Databasehelper {
  static final Databasehelper _instance = Databasehelper.internal();
  factory Databasehelper() => _instance;

  Databasehelper.internal();

  Database? _database;

  // Método para inyectar una base de datos específica (útil para pruebas)
  void setDatabase(Database db) {
    _database = db;
  }

  // Método para limpiar la base de datos inyectada
  void clearDatabase() {
    _database = null;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    final Database db = await getDatabase();
    return db;
  }

  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'products.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE products(
          id TEXT PRIMARY KEY,
          name TEXT,
          price REAL,
          description TEXT
        )
      ''');
      },
    );
  }

  Future<void> insertProduct(Product product) async {
    final Database db = await database;
    await db.insert('products', product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    print("Producto insertado: ${product.name}");
  }

  Future<List<Product>> getProducts() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (index) {
      return Product(
        id: maps[index]['id'],
        name: maps[index]['name'],
        price: maps[index]['price'],
        description: maps[index]['description'],
      );
    });
  }

  Future<void> updateProduct(Product product) async {
    final Database db = await database;
    await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<void> deleteProduct(String id) async {
    final Database db = await database;
    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
