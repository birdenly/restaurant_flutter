import 'dart:math';

import 'package:f02_todo_list/components/drawer.dart';
import 'package:f02_todo_list/components/pratosScreen.dart';
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
  List<Widget> body = const [
    PratosScreen(),
    Icon(Icons.add),
    Icon(Icons.list),
    Icon(Icons.restaurant_menu),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Restaurante do Zé')),
        endDrawer: DrawerWidget(),
        body: body[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Pratos',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cake),
              label: 'Sobremesa',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_cafe),
              label: 'Bebidas',
              backgroundColor: Colors.yellow,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Carrinho',
              backgroundColor: Colors.purple,
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
