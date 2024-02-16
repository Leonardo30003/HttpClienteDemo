import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(HttpClienteDemo());
}

class HttpClienteDemo extends StatelessWidget {
  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HttpClienteDemo',
      theme: ThemeData(
        // Este es el tema de tu aplicación.
        //
        // Prueba a ejecutar tu aplicación. Verás la barra de herramientas de la aplicación en azul. Luego, sin salir de la aplicación,
        // intenta cambiar el primarySwatch a Colors.green y luego invoca "hot reload" (guarda tus cambios o presiona el botón "hot reload"
        // en un IDE compatible con Flutter, o presiona "r" en la consola donde iniciaste la aplicación).
        //
        // Notarás que el contador no se reinicia a cero; el estado de la aplicación no se pierde durante el recargado en caliente.
        // Para reiniciar el estado, utiliza el reinicio en caliente.
        //
        primarySwatch: Colors.blue,
        // Esta línea hace uso de Material 3.
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
