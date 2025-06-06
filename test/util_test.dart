import 'package:flutter_test/flutter_test.dart';
import 'package:product2/core/util.dart';
import 'package:product2/data/models/product.dart';

void main() {
  group('Cart', () {
    setUp(() {
      Cart.items.clear();
    });

    test('debe agregar productos al carrito', () {
      final product1 = Product(
        id: 1,
        title: 'Laptop',
        description: 'Una laptop',
        price: 1000.0,
      );
      final product2 = Product(
        id: 2,
        title: 'Mouse',
        description: 'Un mouse',
        price: 25.0,
      );

      Cart.add(product1);
      Cart.add(product2);

      expect(Cart.items.length, 2);
      expect(Cart.items.contains(product1), true);
      expect(Cart.items.contains(product2), true);
    });

    test('debe remover productos del carrito', () {
      final product = Product(
        id: 1,
        title: 'Laptop',
        description: 'Una laptop',
        price: 1000.0,
      );

      Cart.add(product);
      expect(Cart.items.length, 1);

      Cart.remove(product);
      expect(Cart.items.length, 0);
    });

    test('debe calcular el total correctamente', () {
      final product1 = Product(
        id: 1,
        title: 'Laptop',
        description: 'Una laptop',
        price: 1000.0,
      );
      final product2 = Product(
        id: 2,
        title: 'Mouse',
        description: 'Un mouse',
        price: 25.50,
      );

      Cart.add(product1);
      Cart.add(product2);

      expect(Cart.total, 1025.50);
    });

    test('debe retornar total 0 para carrito vacío', () {
      expect(Cart.total, 0.0);
      expect(Cart.items.isEmpty, true);
    });

    test('debe permitir agregar el mismo producto múltiples veces', () {
      final product = Product(
        id: 1,
        title: 'Laptop',
        description: 'Una laptop',
        price: 1000.0,
      );

      Cart.add(product);
      Cart.add(product);

      expect(Cart.items.length, 2);
      expect(Cart.total, 2000.0);
    });
  });
}