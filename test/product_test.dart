import 'package:flutter_test/flutter_test.dart';
import 'package:product2/data/models/product.dart';

void main() {
  group('Product.fromJson', () {
    test('debe crear un objeto Product válido desde JSON de Fake Store API', () {
      final json = {
        'id': 1,
        'title': 'Laptop Gaming',
        'description': 'Una laptop potente para gaming',
        'price': 999.99,
        'category': 'electronics',
        'image': 'https://example.com/laptop.jpg',
        'rating': {
          'rate': 4.5,
          'count': 120
        }
      };

      final product = Product.fromJson(json);

      expect(product.id, 1);
      expect(product.title, 'Laptop Gaming');
      expect(product.description, 'Una laptop potente para gaming');
      expect(product.price, 999.99);
      expect(product.category, 'electronics');
      expect(product.imageUrl, 'https://example.com/laptop.jpg');
      expect(product.rating, 4.5);
      expect(product.ratingCount, 120);
    });

    test('debe manejar JSON sin rating correctamente', () {
      final json = {
        'id': 2,
        'title': 'Camiseta',
        'description': 'Camiseta de algodón',
        'price': 19.99,
        'category': 'clothing',
        'image': 'https://example.com/shirt.jpg',
      };

      final product = Product.fromJson(json);

      expect(product.id, 2);
      expect(product.title, 'Camiseta');
      expect(product.rating, null);
      expect(product.ratingCount, null);
    });

    test('debe convertir precio entero a double', () {
      final json = {
        'id': 3,
        'title': 'Libro',
        'description': 'Un libro interesante',
        'price': 25, 
        'category': 'books',
        'image': 'https://example.com/book.jpg',
        'rating': {
          'rate': 4,
          'count': 50
        }
      };

      final product = Product.fromJson(json);

      expect(product.price, 25.0);
      expect(product.rating, 4.0);
    });

    test('debe manejar campos opcionales faltantes', () {
      final json = {
        'id': 4,
        'title': 'Producto básico',
        'description': 'Descripción básica',
        'price': 10.0,
      };

      final product = Product.fromJson(json);

      expect(product.category, null);
      expect(product.imageUrl, null);
      expect(product.rating, null);
      expect(product.ratingCount, null);
    });
  });
}