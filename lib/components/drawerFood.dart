import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_app/controller/userController.dart';
import 'package:restaurante_app/model/bebidas.dart';
import 'package:restaurante_app/model/pratos.dart';
import 'package:restaurante_app/model/sobremesa.dart';
import 'package:restaurante_app/model/user.dart';
import 'package:restaurante_app/screens/BebidasEditScreen.dart';
import 'package:restaurante_app/screens/PratosEditScreen.dart';
import 'package:restaurante_app/screens/SobremesaEditScreen.dart';
import 'package:restaurante_app/screens/foodManager.dart';
import 'package:restaurante_app/screens/loginScreen.dart';

class DrawerComida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.add, color: Colors.redAccent),
            title: const Text('Adicionar Prato',
                style: TextStyle(color: Colors.black87)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PratosEditScreen(
                          pratoAtual: Pratos(
                              id: '',
                              nome: '',
                              imagem: '',
                              preco: 0.0,
                              popular: false,
                              ingredientes: '',
                              qtd: ''),
                          edit: false,
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add, color: Colors.redAccent),
            title: const Text('Adicionar Bebida',
                style: TextStyle(color: Colors.black87)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BebidasEditScreen(
                          bebidaAtual: Bebidas(
                              id: '',
                              nome: '',
                              imagem: '',
                              preco: 0.0,
                              popular: false,
                              temp: ''),
                          edit: false,
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add, color: Colors.redAccent),
            title: const Text('Adicionar Sobremesa',
                style: TextStyle(color: Colors.black87)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SobremesaEditScreen(
                          sobremesaAtual: Sobremesa(
                              id: '',
                              nome: '',
                              imagem: '',
                              preco: 0.0,
                              popular: false,
                              calorias: '',
                              ingredientes: ''),
                          edit: false,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
