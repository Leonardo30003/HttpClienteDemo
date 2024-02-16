import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto/main.dart'; // Asegúrate de que la ruta de importación sea correcta

void main() {
  testWidgets('HttpClienteDemo smoke test', (WidgetTester tester) async {
    // Construye nuestra aplicación y activa un frame.
    await tester.pumpWidget(HttpClienteDemo());

    // Verifica que la aplicación contiene el título 'HttpClienteDemo'.
    expect(find.text('HttpClienteDemo'), findsOneWidget);

    // Aquí podrías añadir más pruebas específicas para tu aplicación.
    // Por ejemplo, podrías querer verificar que se muestra un widget de carga inicialmente:
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Después de que se haya completado la carga, podrías querer verificar la lista de publicaciones.
    // Esto requerirá mockear la respuesta de la API o usar un paquete como `http_mock_adapter`.
  });
}
