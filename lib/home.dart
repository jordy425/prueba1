import 'package:flutter/material.dart';
import 'form.dart';
import 'list_ropa.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ropa'), // Título de la barra de navegación
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('STREET VICES', // Título principal
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            const SizedBox(height: 25, width: 600), // Espacio en blanco

            Image.asset('assets/streetvices.png', height: 300,), // Imagen de la marca de ropa

            const SizedBox(height: 25, width: 600), // Espacio en blanco
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyForm())); // Navegar a la pantalla de registro de ropa al hacer clic en el botón "Registrar Ropa"
              },
              child: const Text('Registrar Ropa'), // Texto del botón "Registrar Ropa"
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ListRopa())); // Navegar a la pantalla del carrito de compras al hacer clic en el botón "Ver carrito"
              },
              child: const Text('Ver carrito'), // Texto del botón "Ver carrito"
            ),
          ],
        ));
  }
}
