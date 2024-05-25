import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurante_app/model/comida.dart';

class Bebidas extends Comidas {
  String id;
  String nome;
  double preco;
  String temp;
  bool popular;
  String imagem;

  Bebidas({
    required this.id,
    required this.nome,
    required this.preco,
    required this.temp,
    required this.popular,
    required this.imagem,
  }) : super(id: id, nome: nome, imagem: imagem, preco: preco);

  factory Bebidas.fromJson(Map<String, dynamic> json) {
    return Bebidas(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      preco: json['preco'] ?? 0.0,
      temp: json['temp'] ?? '',
      popular: json['popular'] ?? false,
      imagem: json['imagem'] ?? '',
    );
  }

  Map<String, dynamic> toJson(Bebidas bebida) {
    return {
      'id': bebida.id != '' ? bebida.id : Random().nextInt(1000).toString(),
      'nome': bebida.nome,
      'preco': bebida.preco,
      'temp': bebida.temp,
      'popular': bebida.popular,
      'imagem': bebida.imagem,
    };
  }

  List<Bebidas> get getList {
    return listaDeBebidas;
  }
}

var listaDeBebidas = [
  Bebidas(
      id: Random().nextInt(1000).toString(),
      nome: 'Coca-Cola',
      preco: 3.50,
      temp: 'Gelada',
      popular: true,
      imagem:
          'https://images.unsplash.com/photo-1624552184280-9e9631bbeee9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      id: Random().nextInt(1000).toString(),
      nome: 'Fanta Laranja',
      preco: 3.00,
      temp: 'Gelada',
      popular: true,
      imagem:
          'https://images.unsplash.com/photo-1624517452488-04869289c4ca?q=80&w=2003&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      id: Random().nextInt(1000).toString(),
      nome: 'Suco de Maracujá',
      preco: 2.50,
      temp: 'Natural',
      popular: false,
      imagem:
          'https://images.unsplash.com/photo-1525385133512-2f3bdd039054?q=80&w=1970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      id: Random().nextInt(1000).toString(),
      nome: 'Café',
      preco: 1.50,
      temp: 'Quente',
      popular: true,
      imagem:
          'https://images.unsplash.com/photo-1485808191679-5f86510681a2?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      id: Random().nextInt(1000).toString(),
      nome: 'Chá Verde',
      preco: 2.00,
      temp: 'Quente',
      popular: false,
      imagem:
          'https://images.unsplash.com/photo-1627894005682-166e8687356a?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Bebidas(
      id: Random().nextInt(1000).toString(),
      nome: 'Água',
      preco: 1.00,
      temp: 'Natural',
      popular: true,
      imagem:
          'https://images.unsplash.com/photo-1602904761432-f9ad96133982?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
];
