import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.token,
  });

  // Constructor para usuarios de Firebase
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName,
      email: user.email,
    );
  }

  // Constructor para usuarios de API
  factory UserModel.fromApiResponse(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString(),
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}