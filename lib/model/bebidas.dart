import 'dart:ffi';

import 'package:restaurante_app/model/comida.dart';

class Bebidas extends Comidas {
  String nome;
  double preco;
  String temp;
  bool popular;
  String imagem;

  Bebidas({
    required this.nome,
    required this.preco,
    required this.temp,
    required this.popular,
    required this.imagem,
  }) : super(nome: nome, imagem: imagem, preco: preco);

  List<Bebidas> get getList {
    return listaDeBebidas;
  }
}

var listaDeBebidas = [
  Bebidas(
      nome: 'Coca-Cola',
      preco: 3.50,
      temp: 'Gelada',
      popular: true,
      imagem:
          'https://images.unsplash.com/photo-1624552184280-9e9631bbeee9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      nome: 'Fanta Laranja',
      preco: 3.00,
      temp: 'Gelada',
      popular: true,
      imagem:
          'https://images.unsplash.com/photo-1624517452488-04869289c4ca?q=80&w=2003&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      nome: 'Suco de Maracujá',
      preco: 2.50,
      temp: 'Natural',
      popular: false,
      imagem:
          'https://images.unsplash.com/photo-1525385133512-2f3bdd039054?q=80&w=1970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      nome: 'Café',
      preco: 1.50,
      temp: 'Quente',
      popular: true,
      imagem:
          'https://images.unsplash.com/photo-1485808191679-5f86510681a2?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      nome: 'Chá Verde',
      preco: 2.00,
      temp: 'Quente',
      popular: false,
      imagem:
          'https://images.unsplash.com/photo-1627894005682-166e8687356a?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      nome: 'Água',
      preco: 1.00,
      temp: 'Natural',
      popular: true,
      imagem:
          'https://images.unsplash.com/photo-1602904761432-f9ad96133982?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
];
