import 'package:flutter_test/flutter_test.dart';
import 'package:lista_clientes/databaseHelper.dart';
import 'package:lista_clientes/product.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Inicializa sqflite para pruebas en un entorno de escritorio (no móvil).
void sqfliteTestInit() {
  // Inicializa FFI
  sqfliteFfiInit();
  // Cambia la factory de la base de datos por defecto a la versión FFI
  databaseFactory = databaseFactoryFfi;
}

void main() {
  // Llama a la inicialización de sqflite FFI antes de que se ejecuten las pruebas.
  sqfliteTestInit();

  group('DatabaseHelper Pruebas', () {
    late Databasehelper databaseHelper;
    late Database testDb;

    // Este bloque se ejecuta antes de cada prueba individual.
    setUp(() async {
      databaseHelper = Databasehelper();

      // Crear una base de datos en memoria para las pruebas
      testDb = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

      // Crear la tabla para la prueba
      await testDb.execute('''
        CREATE TABLE IF NOT EXISTS products(
          id TEXT PRIMARY KEY,
          name TEXT,
          price REAL,
          description TEXT,
          email TEXT
        )
      ''');

      // Inyectar la base de datos de prueba en el helper
      databaseHelper.setDatabase(testDb);
    });

    // Este bloque se ejecuta después de cada prueba
    tearDown(() async {
      // Limpiar la base de datos inyectada
      databaseHelper.clearDatabase();
      await testDb.close();
    });

    test('Debe insertar un producto en la base de datos', () async {
      // Arrange: Prepara los datos para la prueba
      final product = Product(
          id: '1',
          name: 'Test Product',
          price: 9.99,
          description: 'A test product',
          email: 'example@gmjail.com');

      // Act: Ejecuta la acción que se va a probar
      await databaseHelper.insertProduct(product);

      // Assert: Verifica que el resultado es el esperado
      final products = await databaseHelper.getProducts();
      expect(products.length, 1);
      expect(products.first.name, 'Test Product');
    });

    test('Debe obtener todos los productos de la base de datos', () async {
      // Arrange
      final product1 = Product(
          id: '1',
          name: 'Product 1',
          price: 10.0,
          description: 'Desc 1',
          email: 'example@gmjail.com');
      final product2 = Product(
          id: '2',
          name: 'Product 2',
          price: 20.0,
          description: 'Desc 2',
          email: 'example@gmjail.com');
      await databaseHelper.insertProduct(product1);
      await databaseHelper.insertProduct(product2);

      // Act
      final products = await databaseHelper.getProducts();

      // Assert
      expect(products.length, 2);
    });

    test('Debe actualizar un producto existente', () async {
      // Arrange
      final originalProduct = Product(
          id: '1',
          name: 'Original Name',
          price: 10.0,
          description: 'Original Desc',
          email: 'example@gmjail.com');
      await databaseHelper.insertProduct(originalProduct);

      final updatedProduct = Product(
          id: '1',
          name: 'Updated Name',
          price: 15.0,
          description: 'Updated Desc',
          email: 'example@gmjail.com');

      // Act
      await databaseHelper.updateProduct(updatedProduct);

      // Assert
      final products = await databaseHelper.getProducts();
      expect(products.length, 1);
      expect(products.first.name, 'Updated Name');
      expect(products.first.price, 15.0);
    });

    test('Debe eliminar un producto de la base de datos', () async {
      // Arrange
      final product = Product(
          id: '1',
          name: 'To be deleted',
          price: 9.99,
          description: 'Delete me',
          email: 'example@gmjail.com');
      await databaseHelper.insertProduct(product);

      // Verifica que el producto fue insertado
      var products = await databaseHelper.getProducts();
      expect(products.length, 1);

      // Act
      await databaseHelper.deleteProduct('1');

      // Assert
      products = await databaseHelper.getProducts();
      expect(products.length,
          0); // Cambiado de isEmpty a length comparison para mayor claridad
    });
  });
}
