import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Vamos a testear un widget simple sin dependencias de Firebase
void main() {
  testWidgets('Container debe renderizar correctamente', (WidgetTester tester) async {
    // Build un widget simple
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text('Test App'),
        ),
      ),
    );

    // Verificar que el texto aparece
    expect(find.text('Test App'), findsOneWidget);
  });

  testWidgets('Botón debe ser encontrado', (WidgetTester tester) async {
    bool buttonPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ElevatedButton(
            onPressed: () {
              buttonPressed = true;
            },
            child: Text('Presionar'),
          ),
        ),
      ),
    );

    // Verificar que el botón existe
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Presionar'), findsOneWidget);

    // Simular tap en el botón
    await tester.tap(find.byType(ElevatedButton));
    expect(buttonPressed, true);
  });

  testWidgets('TextField debe aceptar texto', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Test Input'),
          ),
        ),
      ),
    );

    // Verificar que el TextField existe
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Test Input'), findsOneWidget);

    // Escribir texto
    await tester.enterText(find.byType(TextField), 'Hola Mundo');
    expect(controller.text, 'Hola Mundo');
  });
}