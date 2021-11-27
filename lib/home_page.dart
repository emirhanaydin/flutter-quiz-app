import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Container(
        child: const Center(
          child: Quiz(),
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}
