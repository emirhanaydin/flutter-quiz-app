import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answer.dart';
import 'package:flutter_quiz_app/heading.dart';

typedef AnswerCallback = void Function(String);

class Question extends StatelessWidget {
  final String text;
  final List<String> answers;
  final AnswerCallback onAnswered;

  const Question(this.text,
      {Key? key, required this.answers, required this.onAnswered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Heading(text),
        ...answers.map((e) => SizedBox(
              child: AnswerButton(
                e,
                onPressed: () => onAnswered(e),
              ),
              width: double.infinity,
            ))
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }
}
