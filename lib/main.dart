import 'dart:math';

import 'package:restaurante_app/screens/bebidasScreen.dart';
import 'package:restaurante_app/components/drawer.dart';
import 'package:restaurante_app/screens/loginScreen.dart';
import 'package:restaurante_app/screens/pagamento.dart';
import 'package:restaurante_app/screens/pratosScreen.dart';
import 'package:restaurante_app/screens/sobremesaScreen.dart';
import 'package:restaurante_app/model/comida.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/lista_carrinho.dart';
import 'model/pratos.dart';
import 'model/bebidas.dart';
import 'model/sobremesa.dart';
import 'model/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(restauranteApp());
}

class restauranteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Pratos(
              nome: '',
              preco: 0.0,
              qtd: '',
              popular: false,
              ingredientes: "",
              imagem: '',
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => Sobremesa(
                nome: '',
                preco: 0.0,
                calorias: '',
                popular: false,
                ingredientes: '',
                imagem: ''),
          ),
          ChangeNotifierProvider(
            create: (context) => Bebidas(
                nome: '', preco: 0.0, popular: false, imagem: '', temp: ''),
          ),
          ChangeNotifierProvider(
            create: (context) => User(email: '', password: '', carrinho: []),
          ),
          ChangeNotifierProvider(
            create: (context) => Comidas(
              nome: '',
              imagem: '',
              preco: 0.0,
            ),
          ),
        ],
        child: MaterialApp(
          home: LoginPage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      PratosScreen(),
      sobremesaScreen(),
      bebidasScreen(),
      ListaCarinhoScreen()
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
