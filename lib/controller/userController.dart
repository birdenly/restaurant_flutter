import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:restaurante_app/model/user.dart';

class UserController extends ChangeNotifier {
  final String url = 'https://projetomobile-694f8-default-rtdb.firebaseio.com/';

  Future<List<User>> fetchUsers() async {
    final request = http.get(Uri.parse('$url/users.json'));

    return request.then<List<User>>((response) {
      Map<String, dynamic> users = json.decode(response.body);
      users.forEach((id, user) {
        bool userExists = listaUsuarios.any((u) => u.id == id);
        if (!userExists) {
          listaUsuarios.add(User.fromJson(user));
        }
      });
      print(listaUsuarios.length);
      notifyListeners();
      return listaUsuarios;
    });
  }

  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('$url/users.json'),
      body: json.encode(user.toJson(user)),
    );

    final id = json.decode(response.body)['name'];
    user.id = id;
    listaUsuarios.add(user);
    if (response.statusCode != 200) {
      throw Exception('Failed to add user');
    }
    notifyListeners();
  }

  Future<void> deleteUser(User user) async {
    final response = await http.delete(Uri.parse('$url/users/${user.id}.json'));
    listaUsuarios.remove(user);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
    notifyListeners();
  }

  Future<void> updateUser(User updatedUser) async {
    final response = await http.patch(
      Uri.parse('$url/users/${updatedUser.id}.json'),
      body: json.encode(updatedUser.toJson(updatedUser)),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
    notifyListeners();
  }
}
