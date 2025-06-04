import 'package:flutter_test/flutter_test.dart';
import 'package:product2/data/models/user_model.dart';

void main() {
  group('UserModel.fromApiResponse', () {
    test('debe crear un objeto UserModel válido desde JSON de API', () {
      final json = {
        'id': 1,
        'name': 'Juan Pérez',
        'email': 'juan@example.com',
        'token': 'abc123token',
      };

      final user = UserModel.fromApiResponse(json);

      expect(user.id, '1');
      expect(user.name, 'Juan Pérez');
      expect(user.email, 'juan@example.com');
      expect(user.token, 'abc123token');
    });

    test('retorna valores nulos si el JSON está incompleto', () {
      final json = {
        'id': 99,
      };

      final user = UserModel.fromApiResponse(json);

      expect(user.id, '99');
      expect(user.name, null);
      expect(user.email, null);
      expect(user.token, null);
    });

    test('maneja JSON vacío correctamente', () {
      final json = <String, dynamic>{};

      final user = UserModel.fromApiResponse(json);

      expect(user.id, null);
      expect(user.name, null);
      expect(user.email, null);
      expect(user.token, null);
    });
  });

  group('UserModel.toJson', () {
    test('debe convertir UserModel a JSON correctamente', () {
      final user = UserModel(
        id: '1',
        name: 'María García',
        email: 'maria@test.com',
        token: 'xyz789',
      );

      final json = user.toJson();

      expect(json['id'], '1');
      expect(json['name'], 'María García');
      expect(json['email'], 'maria@test.com');
      expect(json['token'], 'xyz789');
    });
  });
}