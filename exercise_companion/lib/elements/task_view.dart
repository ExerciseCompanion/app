import 'package:flutter/material.dart';
import 'checkbox.dart';

class TaskViewWidget extends StatelessWidget {
  final String title;
  final String text;
  final bool completion;

  const TaskViewWidget(
      {super.key,
      required this.title,
      required this.text,
      required this.completion});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.green,
      height: 100.0,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(title),
        Text(text),
        Checkbox(
          value: completion,
          onChanged: (value) => (),
        ),
      ]),
    ));
  }
}
