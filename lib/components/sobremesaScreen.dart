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
        body: Column(
          children: [
            Row(
              children: [Icon(Icons.star), Text(': Sobremesas Populares')],
            ),
            Expanded(
              child: ListView.builder(
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
                        title: Row(
                          children: [
                            if (listaDeSobremesas[index].popular)
                              Icon(Icons.star),
                            Expanded(
                              child: Text(
                                listaDeSobremesas[index].nome,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Preço: R\$ ${listaDeSobremesas[index].preco.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Confirmação'),
                                  content: Text(
                                      'Você deseja adicionar ${listaDeSobremesas[index].nome} à lista de compras?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Confirmar'),
                                      onPressed: () {
                                        setState(() {
                                          widget.compras
                                              .add(listaDeSobremesas[index]);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
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
                                      SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Ingredientes: ${listaDeSobremesas[index].ingredientes}",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Calorias: ${listaDeSobremesas[index].calorias}",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
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
            )
          ],
        ));
  }
}
