import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  TextComposer({Key? key, required this.sendMessage}) : super(key: key);
  Function(String) sendMessage;

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controller = TextEditingController();
  bool _isComposing = false;

  void cleanInput() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(children: [
        IconButton(
          onPressed: () {},
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
    );
  }
}
