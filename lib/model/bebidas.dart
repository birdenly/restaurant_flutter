import 'dart:ffi';

class Bebidas {
  String nome;
  double preco;
  String temp;
  bool popular;

  Bebidas({
    required this.nome,
    required this.preco,
    required this.temp,
    required this.popular,
  });
}

var listaDeBebidas = [
  Bebidas(
    nome: 'Coca-Cola',
    preco: 3.50,
    temp: 'Gelada',
    popular: true,
  ),
  Bebidas(
    nome: 'Fanta Laranja',
    preco: 3.00,
    temp: 'Gelada',
    popular: true,
  ),
  Bebidas(
    nome: 'Suco de Maracujá',
    preco: 2.50,
    temp: 'Natural',
    popular: false,
  ),
  Bebidas(
    nome: 'Café',
    preco: 1.50,
    temp: 'Quente',
    popular: true,
  ),
  Bebidas(
    nome: 'Chá Verde',
    preco: 2.00,
    temp: 'Quente',
    popular: false,
  ),
  Bebidas(
    nome: 'Água',
    preco: 1.00,
    temp: 'Natural',
    popular: true,
  ),
];
