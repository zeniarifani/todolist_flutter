import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/pages/home.dart';

void main() {
  runApp(const ThisApp());
}

class ThisApp extends StatelessWidget {
  const ThisApp({Key? key}) : super(key: key); // Memperbaiki konstruktor ThisApp

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      home: Home(),
    );
  }
}
