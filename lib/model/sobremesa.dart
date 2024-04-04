import 'dart:ffi';

class Sobremesa {
  String nome;
  double preco;
  String calorias;
  bool popular;
  String ingredientes;

  Sobremesa({
    required this.nome,
    required this.preco,
    required this.calorias,
    required this.popular,
    required this.ingredientes,
  });
}

var listaDeSobremesas = [
  Sobremesa(
    nome: 'Sorvete',
    preco: 5.0,
    calorias: '200 kcal',
    popular: true,
    ingredientes: 'Leite, açúcar, essência de baunilha'
  ),
  Sobremesa(
    nome: 'Pudim',
    preco: 7.0,
    calorias: '250 kcal',
    popular: false,
    ingredientes: 'Leite condensado, ovos, açúcar'
  ),
  Sobremesa(
    nome: 'Torta de Limão',
    preco: 10.0,
    calorias: '300 kcal',
    popular: true,
    ingredientes: 'Farinha, manteiga, açúcar, limão'
  ),
  Sobremesa(
    nome: 'Cheesecake',
    preco: 12.0,
    calorias: '350 kcal',
    popular: false,
    ingredientes: 'Cream cheese, biscoito, açúcar, gelatina'
  ),
  Sobremesa(
    nome: 'Brownie',
    preco: 8.0,
    calorias: '400 kcal',
    popular: true,
    ingredientes: 'Chocolate, farinha, açúcar, ovos'
  ),
  Sobremesa(
    nome: 'Mousse de Maracujá',
    preco: 6.0,
    calorias: '150 kcal',
    popular: false,
    ingredientes: 'Maracujá, leite condensado, creme de leite'
  ),
]
