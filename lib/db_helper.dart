import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._instance();

  DbHelper._instance();

  static Database? _db;

  Future<Database> get db async {
    _db ??= await initDb(); // Si la base de datos aún no está inicializada, llamar a la función initDb() para inicializarla
    return _db!; // Devolver la instancia de la base de datos
  }

  static Future<Database> initDb() async {
    final db = openDatabase(
      join(await getDatabasesPath(), 'streetvices_'), // Obtener la ruta de la base de datos y unirlo con el nombre de la base de datos
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE ropa(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, cantidad INTEGER, precio DOUBLE)', // Crear la tabla 'ropa' con los campos correspondientes
        );
      },
      version: 1, // Versión de la base de datos
    );
    return db; // Devolver la instancia de la base de datos
  }
}
