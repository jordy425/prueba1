import 'package:flutter/material.dart';
import 'package:prueba1/list_ropa.dart';
import 'ropa_model.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlNombre = TextEditingController();
  final _crtlCantidad = TextEditingController();
  final _crtlPrecio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro de ropa'), // Título de la barra de navegación
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Registro', // Título principal del formulario
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 40, 49)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _ctrlNombre,
                        decoration:
                            const InputDecoration(label: Text('Nombre')), // Campo de entrada para el nombre
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese un nombre'; // Validación de campo requerido para el nombre
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _crtlCantidad,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(label: Text('Cantidad')), // Campo de entrada para la cantidad
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese el cantidad'; // Validación de campo requerido para la cantidad
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _crtlPrecio,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(label: Text('Precio')), // Campo de entrada para el precio
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese un precio'; // Validación de campo requerido para el precio
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            submit(); // Llamar a la función submit() al hacer clic en el botón "Guardar" si el formulario es válido
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Registro exitoso')), // Mostrar mensaje de registro exitoso
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListRopa())); // Navegar a la pantalla de lista de ropa después de guardar el registro
                          }
                        },
                        child: const Text('Guardar'), // Texto del botón "Guardar"
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void submit() async {
    final nombre = _ctrlNombre.text;
    final cantidad = _crtlCantidad.text;
    final precio = _crtlPrecio.text;
    Ropa ropa = Ropa(
        nombre: nombre, cantidad: int.parse(cantidad), precio: double.parse(precio)); // Crear un objeto Ropa con los datos ingresados en el formulario
    await Ropa.insertStreetvices(ropa); // Insertar el objeto Ropa en la base de datos
  }
}
