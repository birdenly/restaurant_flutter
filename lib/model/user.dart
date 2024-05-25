import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurante_app/model/comida.dart';

class User extends ChangeNotifier {
  String id;
  String email;
  String password;
  late User userAtual;
  List<Comidas> carrinho = [];

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.carrinho});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      carrinho: json['carrinho'] ?? [],
    );
  }

  void clearCarrinho() {
    carrinho.clear();
    notifyListeners();
  }

  Map<String, dynamic> toJson(User user) {
    return {
      'id': user.id != '' ? user.id : Random().nextInt(1000).toString(),
      'email': user.email,
      'password': user.password,
      'carrinho': user.carrinho,
    };
  }
}

var listaUsuarios = [
  User(id: '', email: 'admin', password: 'admin', carrinho: []),
];
