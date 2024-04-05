import 'package:f02_todo_list/model/comida.dart';
import 'package:f02_todo_list/model/sobremesa.dart';
import 'package:flutter/material.dart';
import '../model/pratos.dart';

class sobremesaScreen extends StatefulWidget {
  List<Comidas> compras;

  sobremesaScreen({required this.compras});

  @override
  _SobremesaScreenState createState() => _SobremesaScreenState();
}

class _SobremesaScreenState extends State<sobremesaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobremesas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listaDeSobremesas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Container(
                  width: 80.0,
                  height: 80.0,
                  child: Image.network(
                    listaDeSobremesas[index].imagem,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  listaDeSobremesas[index].nome,
                  style: TextStyle(fontSize: 24.0),
                ),
                subtitle: Text(
                  'Preço: R\$ ${listaDeSobremesas[index].preco.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18.0),
                ),
                trailing: Checkbox(
                  value: widget.compras.contains(listaDeSobremesas[index]),
                  onChanged: (bool? value) {
                    setState(() {
                      widget.compras.add(listaDeSobremesas[index]);
                    });
                  },
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(listaDeSobremesas[index].nome),
                        content: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 200.0,
                                height: 200.0,
                                child: Image.network(
                                  listaDeSobremesas[index].imagem,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                listaDeSobremesas[index].ingredientes,
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
