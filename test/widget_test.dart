import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Container debe renderizar correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text('Test App'),
        ),
      ),
    );

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

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Presionar'), findsOneWidget);

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

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Test Input'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Hola Mundo');
    expect(controller.text, 'Hola Mundo');
  });
}