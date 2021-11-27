import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Container(
        child: const Center(
          child: Quiz(),
        ),
        margin: const EdgeInsets.all(10),
      ),
    ));
  }
}
