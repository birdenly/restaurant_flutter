import 'package:f02_todo_list/model/bebidas.dart';
import 'package:f02_todo_list/model/comida.dart';
import 'package:f02_todo_list/model/sobremesa.dart';
import 'package:flutter/material.dart';
import '../model/pratos.dart';

class bebidasScreen extends StatelessWidget {
  final List<Comidas> compras;

  const bebidasScreen({required this.compras});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bebidas'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [Icon(Icons.star), Text(': Bebidas Populares')],
            ),
            Expanded(
              child: ListView.builder(
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
                        title: Row(
                          children: [
                            if (listaDeBebidas[index].popular) Icon(Icons.star),
                            Expanded(
                              child: Text(
                                listaDeBebidas[index].nome,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Preço: R\$ ${listaDeBebidas[index].preco.toStringAsFixed(2)}',
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
                                      'Você deseja adicionar ${listaDeBebidas[index].nome} à lista de compras?'),
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
                                        compras.add(listaDeBebidas[index]);
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
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Bebida ${listaDeBebidas[index].temp}",
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
