import 'dart:ffi';
import 'dart:math';

import 'package:restaurante_app/model/comida.dart';

class Pratos extends Comidas {
  String id;
  String nome;
  double preco;
  String qtd;
  bool popular;
  String ingredientes;
  String imagem;

  Pratos({
    required this.id,
    required this.nome,
    required this.preco,
    required this.qtd,
    required this.popular,
    required this.ingredientes,
    required this.imagem,
  }) : super(id: id, nome: nome, imagem: imagem, preco: preco);

  factory Pratos.fromJson(Map<String, dynamic> json) {
    return Pratos(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      preco: json['preco'] ?? 0.0,
      qtd: json['qtd'] ?? '',
      popular: json['popular'] ?? false,
      ingredientes: json['ingredientes'] ?? '',
      imagem: json['imagem'] ?? '',
    );
  }

  Map<String, dynamic> toJson(Pratos prato) {
    return {
      'id': prato.id != '' ? prato.id : Random().nextInt(1000).toString(),
      'nome': prato.nome,
      'preco': prato.preco,
      'qtd': prato.qtd,
      'popular': prato.popular,
      'ingredientes': prato.ingredientes,
      'imagem': prato.imagem,
    };
  }

  List<Pratos> get getList {
    return listaDePratos;
  }
}

var listaDePratos = [
  Pratos(
    id: Random().nextInt(1000).toString(),
    nome: 'Macarrão à Carbonara',
    preco: 25.00,
    qtd: '2',
    popular: false,
    ingredientes: 'Macarrão, bacon, ovos, queijo parmesão, pimenta do reino',
    imagem:
        'https://images.unsplash.com/photo-1627207644206-a2040d60ecad?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Pratos(
    id: Random().nextInt(1000).toString(),
    nome: 'Pizza Margherita',
    preco: 30.00,
    qtd: '4',
    popular: true,
    ingredientes: 'Molho de tomate, mozzarella, manjericão',
    imagem:
        'https://images.unsplash.com/photo-1598023696416-0193a0bcd302?q=80&w=1872&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Pratos(
    id: Random().nextInt(1000).toString(),
    nome: 'Hamburguer',
    preco: 15.00,
    qtd: '1',
    popular: true,
    ingredientes: 'Pão, carne, queijo, alface, tomate',
    imagem:
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1899&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Pratos(
    id: Random().nextInt(1000).toString(),
    nome: 'Frango Xadrez',
    preco: 20.00,
    qtd: '2',
    popular: false,
    ingredientes: 'Frango, pimentão, cebola, molho shoyu',
    imagem:
        'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Pratos(
    id: Random().nextInt(1000).toString(),
    nome: 'Feijoada',
    preco: 35.00,
    qtd: '4',
    popular: true,
    ingredientes: 'Feijão preto, carne de porco, farofa, couve, laranja',
    imagem:
        'https://images.unsplash.com/photo-1602873520153-ec56ca3c205b?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Pratos(
    id: Random().nextInt(1000).toString(),
    nome: 'Lasanha à Bolonhesa',
    preco: 28.00,
    qtd: '3',
    popular: true,
    ingredientes: 'Massa, molho à bolonhesa, queijo, molho branco',
    imagem:
        'https://images.unsplash.com/photo-1629115916087-7e8c114a24ed?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];
