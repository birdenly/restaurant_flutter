import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_app/components/drawer.dart';
import 'package:restaurante_app/components/drawerFood.dart';
import 'package:restaurante_app/controller/comidaController.dart';
import 'package:restaurante_app/model/bebidas.dart';
import 'package:restaurante_app/model/comida.dart';
import 'package:restaurante_app/model/pratos.dart';
import 'package:restaurante_app/model/sobremesa.dart';
import 'package:restaurante_app/screens/BebidasEditScreen.dart';
import 'package:restaurante_app/screens/PratosEditScreen.dart';
import 'package:restaurante_app/screens/SobremesaEditScreen.dart';

class foodManager extends StatefulWidget {
  foodManager({super.key});

  @override
  State<foodManager> createState() => _foodManagerState();
}

class _foodManagerState extends State<foodManager> {
  final associatedController = TextEditingController();

  final idController = TextEditingController();

  final nameController = TextEditingController();

  final imageController = TextEditingController();

  final recomendController = TextEditingController();

  final rateController = TextEditingController();

  final priceController = TextEditingController();

  String tipo = 'Bebidas';

  var listaAtual = [];

  var EditScreen;

  late Future<List<dynamic>> FutureList;

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> FutureList =
        Provider.of<ComidaController>(context, listen: false).fetchBebida();
    return Scaffold(
      endDrawer: DrawerComida(),
      appBar: AppBar(
        title: Text('Editor de comidas'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            DropdownButtonFormField<String>(
              value: tipo,
              items: <String>['Bebidas', 'Sobremesas', 'Pratos']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  tipo = newValue!;

                  if (tipo == 'Bebidas') {
                    listaAtual = listaDeBebidas;
                    FutureList =
                        Provider.of<ComidaController>(context, listen: false)
                            .fetchBebida();
                  } else if (tipo == 'Sobremesas') {
                    listaAtual = listaDeSobremesas;
                    FutureList =
                        Provider.of<ComidaController>(context, listen: false)
                            .fetchSobremesas();
                  } else if (tipo == 'Pratos') {
                    listaAtual = listaDePratos;
                    FutureList =
                        Provider.of<ComidaController>(context, listen: false)
                            .fetchPratos();
                  }
                });
              },
              decoration:
                  InputDecoration(labelText: 'Tipo de comida a ser editada'),
            ),
            Expanded(
              child: Container(
                height: 360,
                color: Colors.redAccent,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listaAtual.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(
                          listaAtual[index].nome,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'R\$ ${listaAtual[index].preco.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                if (tipo == 'Bebidas') {
                                  EditScreen = BebidasEditScreen(
                                    bebidaAtual: listaAtual[index],
                                    edit: true,
                                  );
                                } else if (tipo == 'Sobremesas') {
                                  EditScreen = SobremesaEditScreen(
                                    sobremesaAtual: listaAtual[index],
                                    edit: true,
                                  );
                                } else if (tipo == 'Pratos') {
                                  EditScreen = PratosEditScreen(
                                    pratoAtual: listaAtual[index],
                                    edit: true,
                                  );
                                }
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (_) {
                                    return EditScreen;
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                if (tipo == 'Bebidas') {
                                  Provider.of<ComidaController>(context,
                                          listen: false)
                                      .deleteBebida(listaAtual[index]);
                                } else if (tipo == 'Sobremesas') {
                                  Provider.of<ComidaController>(context,
                                          listen: false)
                                      .deleteSobremesa(listaAtual[index]);
                                } else if (tipo == 'Pratos') {
                                  Provider.of<ComidaController>(context,
                                          listen: false)
                                      .deletePrato(listaAtual[index]);
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Comida removida com sucesso'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ])),
    );
  }
}
