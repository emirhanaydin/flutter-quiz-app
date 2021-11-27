import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _Question {
  final String text;
  final List<String> answers;
  final int correctAnswerIndex;

  _Question(this.text,
      {required this.answers, required this.correctAnswerIndex}) {
    if (correctAnswerIndex < 0 || correctAnswerIndex >= answers.length) {
      throw IndexError(correctAnswerIndex, answers);
    }
  }

  String correctAnswer() => answers[correctAnswerIndex];
}

class _MyAppState extends State<MyApp> {
  final _questions = List.unmodifiable([
    _Question("What's your favorite color?",
        answers: ["Blue", "Red", "Green", "Yellow"], correctAnswerIndex: 0),
    _Question("What's your favorite animal?",
        answers: ["Cat", "Dog", "Cow"], correctAnswerIndex: 2),
  ]);

  var _index = -1;
  late _Question _question;

  void incrementIndex() {
    _index = (_index + 1) % _questions.length;
    _question = _questions[_index];
  }

  void _onAnswered(String answer) {
    if (answer == _question.correctAnswer()) {
      setState(incrementIndex);
    }
  }

  _MyAppState() {
    incrementIndex();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Center(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Question(
                  _question.text,
                  answers: _question.answers,
                  onAnswered: _onAnswered,
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
            margin: const EdgeInsets.all(10),
          ),
        ),
      ),
    ));
  }
}
