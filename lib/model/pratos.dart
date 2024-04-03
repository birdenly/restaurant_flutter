import 'dart:ffi';

class Pratos {
  String nome;
  double preco;
  String qtd;
  Bool popular;
  String ingredientes;

  Pratos({
    required this.nome,
    required this.preco,
    required this.qtd,
    required this.popular,
    required this.ingredientes,
  });
}
