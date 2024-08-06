import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurante_app/components/image_input.dart';
import 'package:restaurante_app/controller/comidaController.dart';
import 'package:restaurante_app/model/pratos.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class PratosEditScreen extends StatefulWidget {
  final Pratos pratoAtual;
  final bool edit;

  PratosEditScreen({Key? key, required this.pratoAtual, required this.edit})
      : super(key: key);

  @override
  PratosEditScreenState createState() => PratosEditScreenState();
}

class PratosEditScreenState extends State<PratosEditScreen> {
  Widget buildImage(String imageData) {
    if (imageData.startsWith('http') || imageData.startsWith('https')) {
      return TextField(
        controller: imageController,
        decoration: InputDecoration(
          labelText: 'Imagem',
          hintText: widget.pratoAtual.imagem,
        ),
        onChanged: (value) {
          widget.pratoAtual.imagem = value;
        },
      );
    } else {
      return Container(
        child: ImageInput(_selectImage, _updateBase64, widget.pratoAtual),
      );
    }
  }

  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final precoController = TextEditingController();
  final qtdController = TextEditingController();
  final ingredientesController = TextEditingController();

  ImagePicker _Imagem = ImagePicker();
  String _base64String = '';

  File? _pickedImage;

  void _selectImage(File? pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _updateBase64(String base64) {
    setState(() {
      _base64String = base64;
    });
  }

  Image imageFromBase64String() {
    return Image.memory(base64Decode(_base64String));
  }

  Uint8List dataFromBase64String() {
    return base64Decode(_base64String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edição/Adição do prato ${widget.pratoAtual.nome}",
          style: TextStyle(fontSize: 15), // Adjust the font size here
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: widget.pratoAtual.nome,
              ),
              onChanged: (value) {
                widget.pratoAtual.nome = value;
              },
            ),
            buildImage(widget.pratoAtual.imagem),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço',
                hintText: widget.pratoAtual.preco.toString(),
              ),
              onChanged: (value) {
                widget.pratoAtual.preco = double.parse(value);
              },
            ),
            TextField(
              controller: qtdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Server quantas pessoas?',
                hintText: widget.pratoAtual.qtd.toString(),
              ),
              onChanged: (value) {
                widget.pratoAtual.qtd = value;
              },
            ),
            CheckboxListTile(
              title: Text('Popular?'),
              value: widget.pratoAtual.popular,
              onChanged: (bool? value) {
                setState(() {
                  widget.pratoAtual.popular = value!;
                });
              },
              enabled: true,
            ),
            TextField(
              controller: ingredientesController,
              decoration: InputDecoration(
                labelText: 'Ingredientes do prato',
                hintText: widget.pratoAtual.ingredientes.toString(),
              ),
              onChanged: (value) {
                widget.pratoAtual.ingredientes = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.edit) {
                  Provider.of<ComidaController>(context, listen: false)
                      .updatePrato(widget.pratoAtual);
                } else {
                  var newPrato = Pratos(
                      id: '',
                      nome: nameController.text,
                      imagem: _base64String,
                      preco: double.parse(precoController.text),
                      popular: widget.pratoAtual.popular,
                      ingredientes: ingredientesController.text,
                      qtd: qtdController.text);
                  Provider.of<ComidaController>(context, listen: false)
                      .addPrato(newPrato);
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
