import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_app/components/SetLocation.dart';
import 'package:restaurante_app/main.dart';
import 'package:restaurante_app/model/comida.dart';
import 'package:restaurante_app/model/user.dart';

class PagamentoScreen extends StatefulWidget {
  @override
  _PagamentoScreenState createState() => _PagamentoScreenState();
}

class _PagamentoScreenState extends State<PagamentoScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  String paymentMethod = 'PIX';
  String _streetName = '';

  void _updateStreetName(String streetName) {
    setState(() {
      _streetName = streetName;
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalValue = 0;
    for (var compra
        in Provider.of<User>(context, listen: false).userAtual.carrinho) {
      totalValue += (compra.preco * compra.counter);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamento'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Container(
              height: 200,
              child: ListView(
                children: Provider.of<User>(context, listen: false)
                    .userAtual
                    .carrinho
                    .map((item) => ListTile(
                          title: Text(item.nome),
                          trailing: Text(
                              'R\$ ${item.preco.toStringAsFixed(2)} x ${item.counter}'),
                        ))
                    .toList(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Total: R\$ ${totalValue.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 17),
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome do cliente'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu nome';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              value: paymentMethod,
              items: <String>['PIX', 'Crédito', 'Débito', 'Espécie']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  paymentMethod = newValue!;
                });
              },
              decoration: InputDecoration(labelText: 'Forma de pagamento'),
            ),
            ElevatedButton(
              onPressed: () async {
                final streetName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LocationInput(onSelectStreet: _updateStreetName),
                  ),
                );

                if (streetName != null) {
                  _updateStreetName(streetName);
                }
              },
              child: Text('Localização'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Icon(Icons.check_circle,
                            color: Colors.green, size: 80),
                        content: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: 200, maxHeight: 200),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pedido confirmado!',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Endereço de entrega: ${_streetName.isNotEmpty ? _streetName : 'Não informado'}',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Forma de pagamento: $paymentMethod',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Obrigado pela preferência, ${nameController.text}!',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Provider.of<User>(context, listen: false)
                                  .userAtual
                                  .carrinho
                                  .forEach((element) {
                                Provider.of<Comidas>(context, listen: false)
                                    .resetCounter(element);
                              });
                              Provider.of<User>(context, listen: false)
                                  .userAtual
                                  .clearCarrinho();
                              Navigator.of(ctx)
                                  .popUntil((route) => route.isFirst);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Confirmar pagamento'),
            ),
          ],
        ),
      ),
    );
  }
}
