import 'package:f02_todo_list/model/comida.dart';
import 'package:flutter/material.dart';
import '../model/pratos.dart';

class PratosScreen extends StatelessWidget {
  List<Comidas> compras;

  PratosScreen({required this.compras});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pratos'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [Icon(Icons.star), Text(': Pratos Populares')],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listaDePratos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          width: 80.0,
                          height: 80.0,
                          child: Image.network(
                            listaDePratos[index].imagem,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Row(
                          children: [
                            if (listaDePratos[index].popular) Icon(Icons.star),
                            Expanded(
                              child: Text(
                                listaDePratos[index].nome,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Preço: R\$ ${listaDePratos[index].preco.toStringAsFixed(2)}',
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
                                      'Você deseja adicionar ${listaDePratos[index].nome} à lista de compras?'),
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
                                        compras.add(listaDePratos[index]);
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
                                title: Text(listaDePratos[index].nome),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: 200.0,
                                        height: 200.0,
                                        child: Image.network(
                                          listaDePratos[index].imagem,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Ingredientes: ${listaDePratos[index].ingredientes}",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Serve para até ${listaDePratos[index].qtd} pessoas",
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
