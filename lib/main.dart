import 'dart:math';

import 'package:f02_todo_list/components/bebidasScreen.dart';
import 'package:f02_todo_list/components/drawer.dart';
import 'package:f02_todo_list/components/pagamento.dart';
import 'package:f02_todo_list/components/pratosScreen.dart';
import 'package:f02_todo_list/components/sobremesaScreen.dart';
import 'package:f02_todo_list/model/comida.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/lista_carrinho.dart';
import 'model/pratos.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Comidas> _carrinho = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      PratosScreen(
        compras: _carrinho,
      ),
      sobremesaScreen(
        compras: _carrinho,
      ),
      bebidasScreen(
        compras: _carrinho,
      ),
      ListaCarinhoScreen(compras: _carrinho),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurante do Zé'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        endDrawer: DrawerWidget(),
        body: body[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Pratos',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cake),
              label: 'Sobremesa',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_cafe),
              label: 'Bebidas',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Carrinho',
              backgroundColor: Colors.red,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
