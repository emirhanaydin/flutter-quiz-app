import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/heading.dart';

class Summary extends StatelessWidget {
  final String title;
  final VoidCallback onRestart;
  final String description;
  final double score;

  const Summary(
      {Key? key,
      required this.title,
      required this.onRestart,
      required this.score,
      this.description = "Restart"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 15,
      children: [
        Heading(title),
        Text("Your personality score is $score"),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: onRestart, child: Text(description))
      ],
    );
  }
}
