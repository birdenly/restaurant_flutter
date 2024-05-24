import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_app/model/user.dart';
import 'package:restaurante_app/screens/pagamento.dart';
import 'package:restaurante_app/model/comida.dart';
import 'package:restaurante_app/model/sobremesa.dart';
import 'package:flutter/material.dart';
import '../model/pratos.dart';
import 'package:provider/provider.dart';

class ListaCarinhoScreen extends StatefulWidget {
  @override
  _ListaCarinhoScreenState createState() => _ListaCarinhoScreenState();
}

class _ListaCarinhoScreenState extends State<ListaCarinhoScreen> {
  var retorno;

  @override
  Widget build(BuildContext context) {
    // limpaCarrinho() {
    //   setState(() {
    //     Provider.of<User>(context, listen: false).carrinho.clear();
    //   });
    // }

    double totalValue = 0;
    for (var compra in Provider.of<User>(context, listen: false).carrinho) {
      totalValue += (compra.preco * compra.counter);
    }

    Provider.of<User>(context).carrinho.length == 0
        ? retorno = Center(
            child: Text("Nada no carrinho de compras!",
                style: TextStyle(fontSize: 20)),
          )
        : retorno = Scaffold(
            appBar: AppBar(
              title: const Text('Carrinho de Compras'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: Provider.of<User>(context, listen: false)
                        .carrinho
                        .length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              leading: Container(
                                width: 80.0,
                                height: 80.0,
                                child: Image.network(
                                  Provider.of<User>(context, listen: false)
                                      .carrinho[index]
                                      .imagem,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                Provider.of<User>(context).carrinho[index].nome,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              subtitle: Text(
                                'Preço: R\$ ${Provider.of<User>(context, listen: false).carrinho[index].preco.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 32,
                                    child: IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (Provider.of<User>(context,
                                                      listen: false)
                                                  .carrinho[index]
                                                  .counter >
                                              1) {
                                            Provider.of<User>(context,
                                                    listen: false)
                                                .carrinho[index]
                                                .counter--;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text(
                                    Provider.of<User>(context)
                                        .carrinho[index]
                                        .counter
                                        .toString(),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 32,
                                    child: IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          Provider.of<User>(context,
                                                  listen: false)
                                              .carrinho[index]
                                              .counter++;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 32,
                                    child: TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext ctx) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Realmente deseja excluir?'),
                                              actions: [
                                                TextButton(
                                                  child: const Text('Cancelar'),
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Excluir'),
                                                  onPressed: () {
                                                    setState(() {
                                                      Provider.of<User>(context,
                                                              listen: false)
                                                          .carrinho
                                                          .removeAt(index);
                                                    });
                                                    Navigator.of(ctx).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: const Icon(Icons.delete),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Total: R\$ ${totalValue.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PagamentoScreen(),
                            ),
                          );
                        },
                        child: Text('Pagar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
    return retorno;
  }
}
