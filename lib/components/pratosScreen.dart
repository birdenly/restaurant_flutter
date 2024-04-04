// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../model/pratos.dart';

class PratosScreen extends StatefulWidget {
  const PratosScreen({super.key});

  @override
  _PratosScreenState createState() => _PratosScreenState();
}

class _PratosScreenState extends State<PratosScreen> {
  List<Pratos> carrinho = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pratos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listaDePratos.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 100.0,
                child: Card(
                  child: ListTile(
                    leading: Container(
                      width: 80.0,
                      height: 80.0,
                      child: Image.network(listaDePratos[index].imagem,
                          fit: BoxFit.cover),
                    ),
                    title: Text(
                      listaDePratos[index].nome,
                      style: TextStyle(fontSize: 24.0),
                    ),
                    trailing: Checkbox(
                      value: carrinho.contains(listaDePratos[index]),
                      onChanged: (bool? value) {
                        setState(() {
                          carrinho.add(listaDePratos[index]);
                        });
                      },
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(listaDePratos[index].nome),
                            content: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 200.0,
                                    height: 200.0,
                                    child: Image.network(
                                        listaDePratos[index].imagem,
                                        fit: BoxFit.cover),
                                  ),
                                  Text(
                                    listaDePratos[index].ingredientes,
                                    style: TextStyle(fontSize: 22.0),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Fechar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          );
        },
      ),
    );
  }
}
