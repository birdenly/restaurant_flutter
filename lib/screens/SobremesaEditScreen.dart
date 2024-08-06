import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurante_app/components/image_input.dart';
import 'package:restaurante_app/controller/comidaController.dart';
import 'package:restaurante_app/model/pratos.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_app/model/sobremesa.dart';
import 'package:image_picker/image_picker.dart';

class SobremesaEditScreen extends StatefulWidget {
  final Sobremesa sobremesaAtual;
  final bool edit;

  SobremesaEditScreen(
      {Key? key, required this.sobremesaAtual, required this.edit})
      : super(key: key);

  @override
  SobremesaEditScreenState createState() => SobremesaEditScreenState();
}

class SobremesaEditScreenState extends State<SobremesaEditScreen> {
  Widget buildImage(String imageData) {
    if (imageData.startsWith('http') || imageData.startsWith('https')) {
      return TextField(
        controller: imageController,
        decoration: InputDecoration(
          labelText: 'Imagem',
          hintText: widget.sobremesaAtual.imagem,
        ),
        onChanged: (value) {
          widget.sobremesaAtual.imagem = value;
        },
      );
    } else {
      return Container(
        child: ImageInput(_selectImage, _updateBase64, widget.sobremesaAtual),
      );
    }
  }

  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final precoController = TextEditingController();
  final caloriasController = TextEditingController();
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
        title: Text("Edição/Adição da sobremesa ${widget.sobremesaAtual.nome}",
            style: TextStyle(fontSize: 15)),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: widget.sobremesaAtual.nome,
              ),
              onChanged: (value) {
                widget.sobremesaAtual.nome = value;
              },
            ),
            buildImage(widget.sobremesaAtual.imagem),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço',
                hintText: widget.sobremesaAtual.preco.toString(),
              ),
              onChanged: (value) {
                widget.sobremesaAtual.preco = double.parse(value);
              },
            ),
            TextField(
              controller: caloriasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Calorias',
                hintText: widget.sobremesaAtual.calorias.toString(),
              ),
              onChanged: (value) {
                widget.sobremesaAtual.calorias = value;
              },
            ),
            CheckboxListTile(
              title: Text('Popular?'),
              value: widget.sobremesaAtual.popular,
              onChanged: (bool? value) {
                setState(() {
                  widget.sobremesaAtual.popular = value!;
                });
              },
              enabled: true,
            ),
            TextField(
              controller: ingredientesController,
              decoration: InputDecoration(
                labelText: 'Ingredientes da sobremesa',
                hintText: widget.sobremesaAtual.ingredientes.toString(),
              ),
              onChanged: (value) {
                widget.sobremesaAtual.ingredientes = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.edit) {
                  Provider.of<ComidaController>(context, listen: false)
                      .updateSobremesa(widget.sobremesaAtual);
                } else {
                  var newSobremesa = Sobremesa(
                      id: '',
                      nome: nameController.text,
                      imagem: _base64String,
                      preco: double.parse(precoController.text),
                      popular: widget.sobremesaAtual.popular,
                      ingredientes: ingredientesController.text,
                      calorias: caloriasController.text);
                  Provider.of<ComidaController>(context, listen: false)
                      .addSobremesa(newSobremesa);
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
