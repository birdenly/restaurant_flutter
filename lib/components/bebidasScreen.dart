import 'package:f02_todo_list/model/bebidas.dart';
import 'package:f02_todo_list/model/comida.dart';
import 'package:f02_todo_list/model/sobremesa.dart';
import 'package:flutter/material.dart';
import '../model/pratos.dart';

class bebidasScreen extends StatefulWidget {
  List<Comidas> compras;

  bebidasScreen({required this.compras});

  @override
  _bebidasScreenState createState() => _bebidasScreenState();
}

class _bebidasScreenState extends State<bebidasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bebidas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listaDeBebidas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Container(
                  width: 80.0,
                  height: 80.0,
                  child: Image.network(
                    listaDeBebidas[index].imagem,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  listaDeBebidas[index].nome,
                  style: TextStyle(fontSize: 24.0),
                ),
                subtitle: Text(
                  'Preço: R\$ ${listaDeBebidas[index].preco.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18.0),
                ),
                trailing: Checkbox(
                  value: widget.compras.contains(listaDeBebidas[index]),
                  onChanged: (bool? value) {
                    setState(() {
                      widget.compras.add(listaDeBebidas[index]);
                    });
                  },
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(listaDeBebidas[index].nome),
                        content: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 200.0,
                                height: 200.0,
                                child: Image.network(
                                  listaDeBebidas[index].imagem,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                listaDeBebidas[index].temp,
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
          );
        },
      ),
    );
  }
}
