import 'dart:ffi';
import 'dart:math';

import 'package:restaurante_app/model/comida.dart';

class Sobremesa extends Comidas {
  String id;
  String nome;
  double preco;
  String calorias;
  bool popular;
  String ingredientes;
  String imagem;

  Sobremesa({
    required this.id,
    required this.nome,
    required this.preco,
    required this.calorias,
    required this.popular,
    required this.ingredientes,
    required this.imagem,
  }) : super(id: id, nome: nome, imagem: imagem, preco: preco);

  factory Sobremesa.fromJson(Map<String, dynamic> json) {
    return Sobremesa(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      preco: json['preco'] ?? 0.0,
      calorias: json['calorias'] ?? '',
      popular: json['popular'] ?? false,
      ingredientes: json['ingredientes'] ?? '',
      imagem: json['imagem'] ?? '',
    );
  }

  Map<String, dynamic> toJson(Sobremesa sobremesa) {
    return {
      'id':
          sobremesa.id != '' ? sobremesa.id : Random().nextInt(1000).toString(),
      'nome': sobremesa.nome,
      'preco': sobremesa.preco,
      'calorias': sobremesa.calorias,
      'popular': sobremesa.popular,
      'ingredientes': sobremesa.ingredientes,
      'imagem': sobremesa.imagem,
    };
  }

  List<Sobremesa> get getList {
    return listaDeSobremesas;
  }
}

var listaDeSobremesas = [
  Sobremesa(
      id: Random().nextInt(1000).toString(),
      nome: 'Sorvete',
      preco: 5.0,
      calorias: '200 kcal',
      popular: true,
      ingredientes: 'Leite, açúcar, essência de baunilha',
      imagem:
          'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Sobremesa(
      id: Random().nextInt(1000).toString(),
      nome: 'Pudim',
      preco: 7.0,
      calorias: '250 kcal',
      popular: false,
      ingredientes: 'Leite condensado, ovos, açúcar',
      imagem:
          'https://images.unsplash.com/photo-1637264596042-fcf205a81e1e?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Sobremesa(
      id: Random().nextInt(1000).toString(),
      nome: 'Torta de Limão',
      preco: 10.0,
      calorias: '300 kcal',
      popular: true,
      ingredientes: 'Farinha, manteiga, açúcar, limão',
      imagem:
          'https://images.unsplash.com/photo-1552941622-d258097f38b9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Sobremesa(
      id: Random().nextInt(1000).toString(),
      nome: 'Cheesecake',
      preco: 12.0,
      calorias: '350 kcal',
      popular: false,
      ingredientes: 'Cream cheese, biscoito, açúcar, gelatina',
      imagem:
          'https://images.unsplash.com/photo-1578775887804-699de7086ff9?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Sobremesa(
      id: Random().nextInt(1000).toString(),
      nome: 'Brownie',
      preco: 8.0,
      calorias: '400 kcal',
      popular: true,
      ingredientes: 'Chocolate, farinha, açúcar, ovos',
      imagem:
          'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Sobremesa(
      id: Random().nextInt(1000).toString(),
      nome: 'Mousse de Morango',
      preco: 6.0,
      calorias: '150 kcal',
      popular: false,
      ingredientes: 'Morango, leite condensado, creme de leite',
      imagem:
          'https://plus.unsplash.com/premium_photo-1667683962423-4f4ecad35e34?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
];
