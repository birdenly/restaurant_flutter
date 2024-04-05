import 'package:f02_todo_list/components/pagemento.dart';
import 'package:f02_todo_list/model/comida.dart';
import 'package:f02_todo_list/model/sobremesa.dart';
import 'package:flutter/material.dart';
import '../model/pratos.dart';

class ListaCarinhoScreen extends StatefulWidget {
  List<Comidas> compras;

  ListaCarinhoScreen({required this.compras});

  @override
  _ListaCarinhoScreenState createState() => _ListaCarinhoScreenState();
}

class _ListaCarinhoScreenState extends State<ListaCarinhoScreen> {
  var retorno;
  @override
  Widget build(BuildContext context) {
    double totalValue = 0;
    for (var compra in widget.compras) {
      totalValue += compra.preco;
    }

    widget.compras.length == 0
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
                    itemCount: widget.compras.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            child: Card(
                              child: ListTile(
                                leading: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: Image.network(
                                    widget.compras[index].imagem,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  widget.compras[index].nome,
                                  style: TextStyle(fontSize: 24.0),
                                ),
                                subtitle: Text(
                                  'Preço: R\$ ${widget.compras[index].preco.toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                trailing: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              Text('Realmente deseja excluir?'),
                                          actions: [
                                            TextButton(
                                              child: Text('Cancelar'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Excluir'),
                                              onPressed: () {
                                                setState(() {
                                                  widget.compras
                                                      .removeAt(index);
                                                });
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(Icons.delete),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
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
                          'Total: R\$ $totalValue',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the payment page
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
