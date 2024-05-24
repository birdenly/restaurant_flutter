import 'package:flutter/material.dart';
import 'package:restaurante_app/model/comida.dart';

class User extends ChangeNotifier {
  String email;
  String password;
  List<Comidas> carrinho = [];
  User({required this.email, required this.password, required this.carrinho});
  late User userAtual;

  void clearCarrinho() {
    carrinho.clear();
    notifyListeners();
  }

  // bool checaSenha(String email, String password) {
  //   // // final user = listaUsuarios.firstWhere((u) => u.email == email);
  //   // // return user.password == password;
  //   // if (password == user.email[0].password[0]) {
  //   //   return true;
  //   // } else {
  //   //   return false;
  //   // }
  // }
}

var listaUsuarios = [
  User(email: 'admin', password: 'admin', carrinho: []),
];
