import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurante_app/controller/comidaController.dart';
import 'package:restaurante_app/model/bebidas.dart';
import 'package:restaurante_app/model/pratos.dart';
import 'package:provider/provider.dart';

class BebidasEditScreen extends StatefulWidget {
  final Bebidas bebidaAtual;
  final bool edit;

  BebidasEditScreen({Key? key, required this.bebidaAtual, required this.edit})
      : super(key: key);

  @override
  BebidasEditScreenState createState() => BebidasEditScreenState();
}

class BebidasEditScreenState extends State<BebidasEditScreen> {
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final precoController = TextEditingController();
  final tempController = TextEditingController();
  final ingredientesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edição/Adição da bebida ${widget.bebidaAtual.nome}",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: widget.bebidaAtual.nome,
              ),
              onChanged: (value) {
                widget.bebidaAtual.nome = value;
              },
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(
                labelText: 'Imagem',
                hintText: widget.bebidaAtual.imagem,
              ),
              onChanged: (value) {
                widget.bebidaAtual.imagem = value;
              },
            ),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço',
                hintText: widget.bebidaAtual.preco.toString(),
              ),
              onChanged: (value) {
                widget.bebidaAtual.preco = double.parse(value);
              },
            ),
            TextField(
              controller: tempController,
              decoration: InputDecoration(
                labelText: 'Temperatura da bebida',
                hintText: widget.bebidaAtual.temp.toString(),
              ),
              onChanged: (value) {
                widget.bebidaAtual.temp = value;
              },
            ),
            CheckboxListTile(
              title: Text('Popular?'),
              value: widget.bebidaAtual.popular,
              onChanged: (bool? value) {
                setState(() {
                  widget.bebidaAtual.popular = value!;
                });
              },
              enabled: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.edit) {
                  Provider.of<ComidaController>(context, listen: false)
                      .updateBebida(widget.bebidaAtual);
                } else {
                  var newBebida = Bebidas(
                      id: '',
                      nome: nameController.text,
                      imagem: imageController.text,
                      preco: double.parse(precoController.text),
                      popular: widget.bebidaAtual.popular,
                      temp: tempController.text);
                  Provider.of<ComidaController>(context, listen: false)
                      .addBebida(newBebida);
                }
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
