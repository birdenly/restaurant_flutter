import 'package:provider/provider.dart';
import 'package:restaurante_app/model/comida.dart';
import 'package:restaurante_app/model/sobremesa.dart';
import 'package:flutter/material.dart';
import 'package:restaurante_app/model/user.dart';
import '../model/pratos.dart';

class sobremesaScreen extends StatelessWidget {
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
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  title: Text('Confirmação'),
                                  content: Text(
                                      'Você deseja adicionar ${listaDeSobremesas[index].nome} à lista de compras?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Confirmar'),
                                      onPressed: () {
                                        if (Provider.of<User>(context,
                                                    listen: false)
                                                .userAtual
                                                .carrinho
                                                .contains(
                                                    listaDeSobremesas[index]) ==
                                            false) {
                                          Provider.of<User>(context,
                                                  listen: false)
                                              .userAtual
                                              .carrinho
                                              .add(listaDeSobremesas[index]);
                                          Navigator.of(ctx).pop();
                                        } else {
                                          for (var i in Provider.of<User>(
                                                  context,
                                                  listen: false)
                                              .userAtual
                                              .carrinho) {
                                            if (i == listaDeSobremesas[index]) {
                                              i.counter++;
                                              Navigator.of(ctx).pop();
                                            }
                                          }
                                        }
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
