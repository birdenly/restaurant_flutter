import 'dart:ffi';

import 'package:flutter/material.dart';

class Comidas extends ChangeNotifier {
  String id;
  String nome;
  String imagem;
  double preco;
  int counter = 1;

  Comidas({
    required this.id,
    required this.nome,
    required this.imagem,
    required this.preco,
    this.counter = 1,
  });
}
