import 'package:flutter/material.dart';
import 'package:restaurante_app/model/comida.dart';

class User extends ChangeNotifier {
  String name;
  // String email;
  // String password;
  List<Comidas> carrinho = [];
  User({required this.name});

  void clearCarrinho() {
    carrinho.clear();
    notifyListeners();
  }
}
