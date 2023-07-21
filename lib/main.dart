import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return MaterialApp(
      title: 'Convertir metros a millas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Convertir metros a millas'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Introduce la distancia en metros:'),
              TextField(
                decoration: InputDecoration(hintText: 'Metros'),
                controller: _controller,
              ),
              Builder( // Usar Builder para obtener un nuevo BuildContext dentro del Scaffold
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      final metros = int.tryParse(_controller.text) ?? 0;
                      final millas = metros / 1609.344;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '$metros metros son iguales a $millas millas.',
                          ),
                        ),
                      );
                    },
                    child: Text('Convertir'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
