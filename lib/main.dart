import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
  FirebaseFirestore.instance
      .collection("mensagens")
      .doc()
      .set({'from': 'Carlos', 'text': 'tudo bem também'});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Flutter',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: Container(),
    );
  }
}
