import 'package:chat_flutter/helpers/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final db = FirebaseFirestore.instance;

  void _sendMessage(String text) {
    // FirebaseFirestore.instance.collection('messages').add({'text': text});
    db.collection("messages").doc().set({'text': text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Olá'),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(),
          TextComposer(
            sendMessage: (text) {
              _sendMessage;
              print(text);
            },
          ),
        ],
      ),
    );
  }
}
