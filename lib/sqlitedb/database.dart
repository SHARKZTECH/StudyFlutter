import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'product.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();

  static final SQLiteDbProvider db = SQLiteDbProvider._();

  late Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ProductDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE Product (
            id INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT,
            price INTEGER,
            image TEXT
          );
        """);
        await insertProducts(db);
      },
    );
  }

  Future<void> insertProducts(Database db) async {
    await db.insert('Product', {
      'id': 1,
      'name': 'iPhone',
      'description': 'iPhone is the stylist phone ever',
      'price': 1000,
      'image': 'iphone.png'
    });

    await db.insert('Product', {
      'id': 2,
      'name': 'Pixel',
      'description': 'Pixel is the most feature phone ever',
      'price': 800,
      'image': 'pixel.png'
    });

    await db.insert('Product', {
      'id': 3,
      'name': 'Laptop',
      'description': 'Laptop is most productive development tool',
      'price': 2000,
      'image': 'laptop.png'
    });

    await db.insert('Product', {
      'id': 4,
      'name': 'Tablet',
      'description': 'Tablet is most productive development tool',
      'price': 1500,
      'image': 'tablet.png'
    });

    await db.insert('Product', {
      'id': 5,
      'name': 'Pendrive',
      'description': 'Pendrive is useful storage medium',
      'price': 100,
      'image': 'pendrive.png'
    });

    await db.insert('Product', {
      'id': 6,
      'name': 'Floppy Drive',
      'description': 'Floppy drive is useful rescue storage medium',
      'price': 20,
      'image': 'floppy.png'
    });
  }

  Future<List<Product>> getAllProducts() async {
    try {
      final db = await database;
      List<Map<String, dynamic>> results = await db.query(
        "Product",
        columns: Product.columns,
        orderBy: "id ASC",
      );
      List<Product> products =
          results.map((result) => Product.fromMap(result)).toList();
      return products;
    } catch (e) {
      print("Error fetching products: $e");
      throw Exception(
          "Failed to fetch products"); // Throw an exception or handle error as needed
    }
  }

  Future<Product> getProductById(int id) async {
    final db = await database;
    var result = await db.query("Product", where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty
        ? Product.fromMap(result.first as Map<String, dynamic>)
        : throw Exception("Product not found");
  }

  Future<int> insert(Product product) async {
    final db = await database;
    var maxIdResult =
        await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Product");
    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT Into Product (id, name, description, price, image) VALUES (?, ?, ?, ?, ?)",
        [id, product.name, product.description, product.price, product.image]);
    return result;
  }

  Future<int> update(Product product) async {
    final db = await database;
    var result = await db.update("Product", product.toMap(),
        where: "id = ?", whereArgs: [product.id]);
    return result;
  }

  Future<int> delete(int id) async {
    final db = await database;
    var result = await db.delete("Product", where: "id = ?", whereArgs: [id]);
    return result;
  }
}
