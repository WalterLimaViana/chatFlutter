import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  TextComposer({Key? key}) : super(key: key);

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.photo_camera),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Enviar mensagem',
            ),
            onChanged: (text) {
              setState(() {
                _isComposing = text.isNotEmpty;
              });
            },
            onSubmitted: (text) {},
          ),
        ),
        IconButton(
          onPressed: _isComposing ? () {} : null,
          icon: Icon(Icons.send),
        )
      ]),
    );
  }
}