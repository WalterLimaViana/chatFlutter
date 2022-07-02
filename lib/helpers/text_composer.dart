import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer({Key? key, required this.sendMessage}) : super(key: key);
  Function(String) sendMessage;

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controller = TextEditingController();
  bool _isComposing = false;
  File? imgFile;
  final imgPicker = ImagePicker();

  Future<void> showOptionsDialog(
    BuildContext context,
  ) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                'Opções',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Center(
                    child: GestureDetector(
                      child: Text(
                        'Tirar foto',
                      ),
                      onTap: () {
                        openCamera();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      child: Text('Pegar da Galeria'),
                      onTap: () {
                        openGallery();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void cleanInput() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imgPicker = ImagePicker();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        displayImage(),
        SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [
            IconButton(
              onPressed: () {
                showOptionsDialog(context);
              },
              icon: Icon(Icons.photo_camera),
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensagem',
                ),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: (text) {
                  widget.sendMessage(text);
                  cleanInput();
                },
              ),
            ),
            IconButton(
              onPressed: _isComposing
                  ? () {
                      widget.sendMessage(_controller.text);
                      cleanInput();
                    }
                  : null,
              icon: Icon(Icons.send),
            )
          ]),
        ),
      ],
    );
  }

  openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery!.path);
    });
    Navigator.of(context).pop();
  }

  Widget displayImage() {
    if (imgFile == null) {
      return Container();
    } else {
      return Image.file(imgFile!, width: 350, height: 350);
    }
  }
}
