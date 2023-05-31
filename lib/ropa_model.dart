import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class Ropa {
  final int? id;
  final String nombre;
  final int cantidad;
  final double precio;

  const Ropa({
    this.id,
    required this.nombre,
    required this.cantidad,
    required this.precio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'cantidad': cantidad,
      'precio': precio,
    };
  }

  @override
  String toString() {
    return 'Ropa{id: $id, nombre: $nombre, cantidad: $cantidad, precio: $precio}';
  }

  static Future<List<Ropa>> getStreetvices() async {
    final Database db = await DbHelper.initDb(); // Obtener la instancia de la base de datos
    final List<Map<String, dynamic>> maps = await db.query('ropa'); // Ejecutar una consulta a la tabla 'ropa' que esta en la base de datos y obtener los resultados en una lista de mapas
    return List.generate(maps.length, (i) {
      return Ropa(
        id: maps[i]['id'],
        nombre: maps[i]['nombre'],
        cantidad: maps[i]['cantidad'],
        precio: maps[i]['precio'],
      ); // Generar una lista de objetos Ropa a partir del maps obtenido
    });
  }

  static Future<int> insertStreetvices(Ropa streetvices_) async {
    final Database db = await DbHelper.initDb(); // Se obtiene la instancia de la base de datos
    final int result = await db.insert('ropa', streetvices_.toMap()); // Insertar el objeto Ropa en la tabla 'ropa'
    return result; // Devolver el resultado del registro de datos
  }

  static Future<int> eliminarProductos(List<Ropa> streetvices_) async {
    final Database db = await DbHelper.initDb(); // Obtener la instancia de la base de datos
    return await db.delete(
      'ropa',
    ); // Eliminar todos los registros de la tabla 'ropa' de la base de datos
  }
}
