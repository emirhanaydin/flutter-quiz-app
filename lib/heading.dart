import 'package:flutter/cupertino.dart';

class Heading extends StatelessWidget {
  final String data;

  const Heading(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          data,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        )
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }
}
