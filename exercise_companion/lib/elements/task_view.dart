import 'package:flutter/material.dart';
//import 'package:percent_indicator/percent_indicator.dart';
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

  Widget getCompletionWidget(bool completion) {
    if (completion) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {},
          child: const Text('Claim'));
    } else {
      return Text("In Progress");
    }
  }

  Icon getCompletionIcon(bool completion, BuildContext context) {
    if (completion) {
      return Icon(Icons.task, color: Theme.of(context).primaryColor);
    } else {
      return Icon(Icons.task_outlined, color: Theme.of(context).primaryColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: getCompletionIcon(completion, context),
      title: Text(title),
      subtitle: Text(text),
      trailing: getCompletionWidget(completion),
      /*Checkbox(
        value: completion,
        onChanged: (value) => (),
      ),*/
    ); /*Center(
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
    ));*/
  }
}
