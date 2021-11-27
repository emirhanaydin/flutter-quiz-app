import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/question.dart';
import 'package:flutter_quiz_app/summary.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _questions = List.unmodifiable([
    _Question("What's your favorite color?", answers: [
      _Answer("Blue", score: 10),
      _Answer("Red", score: 8),
      _Answer("Green", score: 6),
      _Answer("Yellow", score: 4),
    ]),
    _Question("What's your favorite animal?", answers: [
      _Answer("Cat", score: 2),
      _Answer("Dog", score: 6),
      _Answer("Cow", score: 10),
    ]),
  ]);

  late int _index;
  late double _totalScore;
  late _Question _question;

  _QuizState() {
    _reset();
  }

  void _incrementIndex() {
    _index++;
    if (_hasAnyQuestions()) _question = _questions[_index];
  }

  void _setNextState() {
    setState(_incrementIndex);
  }

  bool _hasAnyQuestions() => _index < _questions.length;

  void _giveAnswer(String text) {
    var answer = _question.findAnswer(text);
    _totalScore += answer.score;
    _setNextState();
  }

  void _reset() {
    _totalScore = 0;
    _index = -1;
    _incrementIndex();
  }

  void _resetState() {
    setState(() {
      _reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _hasAnyQuestions()
        ? Question(
            _question.text,
            answers: _question.answers.map((e) => e.text).toList(),
            onAnswered: _giveAnswer,
          )
        : Summary(
            title: "Quiz is done.",
            onRestart: _resetState,
            score: _totalScore,
          );
  }
}

class _Question {
  final String text;
  final List<_Answer> answers;

  _Question._internal(this.text, {required this.answers});

  factory _Question(String text, {required List<_Answer> answers}) {
    return _Question._internal(text, answers: List.unmodifiable(answers));
  }

  _Answer findAnswer(String text) => answers.firstWhere((e) => e.text == text);
}

class _Answer {
  final String text;
  final double score;

  _Answer(this.text, {required this.score});
}
