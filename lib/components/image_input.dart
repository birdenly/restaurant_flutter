import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:restaurante_app/model/comida.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  final Function updateBase64;
  final Comidas comida;

  ImageInput(this.onSelectImage, this.updateBase64, this.comida);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  String? base64String;
  //Capturando Imagem
  File? _storedImage;

  @override
  void initState() {
    super.initState();
    if (widget.comida.imagem != null && widget.comida.imagem.isNotEmpty) {
      base64String = widget.comida.imagem;
      _storedImage = File.fromRawPath(base64Decode(base64String!));
    }
  }

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    if (imageFile == null) return;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    List<int> imageBytes = File(_storedImage!.path).readAsBytesSync();
    base64String = base64Encode(imageBytes);

    // // pegar pasta que posso salvar documentos
    // final appDir = await syspaths.getApplicationDocumentsDirectory();
    // String fileName = path.basename(_storedImage!.path);
    // final savedImage = await _storedImage!.copy(
    //   '${appDir.path}/$fileName',
    // );
    widget.updateBase64(base64String);
    widget.onSelectImage(base64String);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          //child: Text('Nenhuma imagem!'),
          //verificar se tem imagem
          child: _storedImage != null
              ? Image.memory(
                  base64Decode(base64String!),
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Text('Nenhuma Imagem!'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Tirar foto'),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
