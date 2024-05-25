import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurante_app/model/bebidas.dart';
import 'package:restaurante_app/model/comida.dart';
import 'package:restaurante_app/model/pratos.dart';
import 'package:restaurante_app/model/sobremesa.dart';
import 'dart:convert';

import 'package:restaurante_app/model/user.dart';

class ComidaController extends ChangeNotifier {
  final String url = 'https://projetou2-f2b05-default-rtdb.firebaseio.com/';

  //// PRATOS

  Future<List<Pratos>> fetchPratos() async {
    final request = http.get(Uri.parse('$url/comida/pratos.json'));

    return request.then<List<Pratos>>((response) {
      Map<String, dynamic> pratos = json.decode(response.body);
      pratos.forEach((id, prato) {
        bool pratoExists = listaDePratos.any((u) => u.id == id);
        if (!pratoExists) {
          listaDePratos.add(Pratos.fromJson(prato));
        }
      });
      print(listaDePratos.length);
      notifyListeners();
      return listaDePratos;
    });
  }

  Future<void> addPrato(Pratos prato) async {
    final response = await http.post(
      Uri.parse('$url/comida/pratos.json'),
      body: json.encode(prato.toJson(prato)),
    );

    final id = json.decode(response.body)['name'];
    prato.id = id;
    listaDePratos.add(prato);
    if (response.statusCode != 200) {
      throw Exception('Failed to add user');
    }
    notifyListeners();
  }

  Future<void> deletePrato(Pratos prato) async {
    final response =
        await http.delete(Uri.parse('$url/comida/pratos/${prato.id}.json'));
    listaDePratos.remove(prato);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
    notifyListeners();
  }

  Future<void> updatePrato(Pratos prato) async {
    final response = await http.patch(
      Uri.parse('$url/comida/pratos/${prato.id}.json'),
      body: json.encode(prato.toJson(prato)),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
    notifyListeners();
  }

  ///// SOBREMESAS

  Future<List<Sobremesa>> fetchSobremesas() async {
    final request = http.get(Uri.parse('$url/comida/sobremesas.json'));

    return request.then<List<Sobremesa>>((response) {
      Map<String, dynamic> sobremesas = json.decode(response.body);
      sobremesas.forEach((id, user) {
        bool sobremesaExists = listaDeSobremesas.any((u) => u.id == id);
        if (!sobremesaExists) {
          listaDeSobremesas.add(Sobremesa.fromJson(user));
        }
      });
      print(listaDeSobremesas.length);
      notifyListeners();
      return listaDeSobremesas;
    });
  }

  Future<void> addSobremesa(Sobremesa sobremesa) async {
    final response = await http.post(
      Uri.parse('$url/comida/sobremesas.json'),
      body: json.encode(sobremesa.toJson(sobremesa)),
    );

    final id = json.decode(response.body)['name'];
    sobremesa.id = id;
    listaDeSobremesas.add(sobremesa);
    if (response.statusCode != 200) {
      throw Exception('Failed to add user');
    }
    notifyListeners();
  }

  Future<void> deleteSobremesa(Sobremesa sobremesa) async {
    final response = await http
        .delete(Uri.parse('$url/comida/sobremesas/${sobremesa.id}.json'));
    listaDeSobremesas.remove(sobremesa);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
    notifyListeners();
  }

  Future<void> updateSobremesa(Sobremesa sobremesa) async {
    final response = await http.patch(
      Uri.parse('$url/comida/sobremesas/${sobremesa.id}.json'),
      body: json.encode(sobremesa.toJson(sobremesa)),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
    notifyListeners();
  }

  ///// BEBIDAS

  Future<List<Bebidas>> fetchBebida() async {
    final request = http.get(Uri.parse('$url/comida/bebidas.json'));

    return request.then<List<Bebidas>>((response) {
      Map<String, dynamic> bebidas = json.decode(response.body);
      bebidas.forEach((id, user) {
        bool bebidaExists = listaDeBebidas.any((u) => u.id == id);
        if (!bebidaExists) {
          listaDeBebidas.add(Bebidas.fromJson(user));
        }
      });
      print(listaDeBebidas.length);
      notifyListeners();
      return listaDeBebidas;
    });
  }

  Future<void> addBebida(Bebidas bebida) async {
    final response = await http.post(
      Uri.parse('$url/comida/bebidas.json'),
      body: json.encode(bebida.toJson(bebida)),
    );

    final id = json.decode(response.body)['name'];
    bebida.id = id;
    listaDeBebidas.add(bebida);
    if (response.statusCode != 200) {
      throw Exception('Failed to add user');
    }
    notifyListeners();
  }

  Future<void> deleteBebida(Bebidas bebida) async {
    final response =
        await http.delete(Uri.parse('$url/comida/bebidas/${bebida.id}.json'));
    listaDeBebidas.remove(bebida);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
    notifyListeners();
  }

  Future<void> updateBebida(Bebidas bebida) async {
    final response = await http.patch(
      Uri.parse('$url/comida/bebidas/${bebida.id}.json'),
      body: json.encode(bebida.toJson(bebida)),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
    notifyListeners();
  }
}
