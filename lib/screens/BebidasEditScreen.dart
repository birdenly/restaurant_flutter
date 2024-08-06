import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurante_app/components/image_input.dart';
import 'package:restaurante_app/controller/comidaController.dart';
import 'package:restaurante_app/model/bebidas.dart';
import 'package:restaurante_app/model/pratos.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
  Widget buildImage(String imageData) {
    if (imageData.startsWith('http') || imageData.startsWith('https')) {
      return TextField(
        controller: imageController,
        decoration: InputDecoration(
          labelText: 'Imagem',
          hintText: widget.bebidaAtual.imagem,
        ),
        onChanged: (value) {
          widget.bebidaAtual.imagem = value;
        },
      );
    } else {
      return Container(
        child: ImageInput(_selectImage, _updateBase64, widget.bebidaAtual),
      );
    }
  }

  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final precoController = TextEditingController();
  final tempController = TextEditingController();
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
            buildImage(widget.bebidaAtual.imagem),
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
                      imagem: _base64String,
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
