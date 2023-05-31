import 'package:flutter/material.dart';
import 'ropa_model.dart';

class ListRopa extends StatefulWidget {
  const ListRopa({Key? key}) : super(key: key);

  @override
  State<ListRopa> createState() => _ListRopaState();
}

class _ListRopaState extends State<ListRopa> {
  List<Ropa> ropa = []; // Lista de productos de ropa

  @override
  void initState() {
    loadRopa(); // Cargar la lista de productos de ropa al iniciar el estado
    super.initState();
  }

  double calcularTotal() {
    double total = 0;
    for (var producto in ropa) {
      total += producto.cantidad * producto.precio; // Calcular el total multiplicando la cantidad por el precio de cada producto
    }
    return total;
  }

  void eliminarProductos() {
    setState(() {
      ropa.clear(); // Eliminar todos los productos de ropa de la lista
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista'), // Título de la barra de navegación
      ),
      body: ListView.separated(
        itemCount: ropa.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(), // Separador entre los elementos de la lista
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ropa[index].nombre), // Mostrar el nombre del producto
                  Text('${ropa[index].cantidad}'), // Mostrar la cantidad del producto
                ],
              ),
              Text('${ropa[index].precio}'), // Mostrar el precio del producto
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _eliminarProductos(); // Llamar a la función privada _eliminarProductos() al hacer clic en el botón
          eliminarProductos(); // Eliminar los productos de la lista
        },
        label: Text('Total: \$${calcularTotal().toStringAsFixed(2)}'), // Mostrar el total calculado en el botón
        icon: const Icon(Icons.attach_money), // Icono del botón
        backgroundColor: Colors.purple, // Color de fondo del botón
        elevation: 2.0,
      ),
    );
  }

  void loadRopa() async {
    final ropaList = await Ropa.getStreetvices(); // Cargar la lista de productos de ropa desde la fuente de datos
    setState(() {
      ropa = ropaList; // Asignar la lista cargada a la variable de lista de ropa
    });
  }

  void _eliminarProductos() {
    Ropa.eliminarProductos(ropa); // Llamar a la función estática eliminarProductos() que esta en el modelo para limpiar la base de datos
  }
}
