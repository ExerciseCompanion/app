import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/task_provider.dart';
//import 'package:percent_indicator/percent_indicator.dart';
import '../../generic/presentation/checkbox.dart';

class TaskViewWidget extends ConsumerWidget {
  final String title;
  final String text;
  //final bool completion;
  final int completion;
  final int taskID;

  const TaskViewWidget(
      {super.key,
      required this.title,
      required this.text,
      required this.completion,
      required this.taskID});

  void onClaim(WidgetRef ref) {
    ref.read(taskProvider.notifier).claim(taskID);
  }

  Widget getCompletionWidget(int completion, WidgetRef ref) {
    if (completion == 1) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: () => {onClaim(ref)},
          child: const Text('Claim'));
    } else if (completion == 0) {
      return const Text("In Progress");
    } else {
      return const Text("Claimed");
    }
  }

  Icon getCompletionIcon(int completion, BuildContext context) {
    if (completion == 0) {
      return Icon(Icons.task_outlined, color: Theme.of(context).primaryColor);
    } else {
      return Icon(Icons.task, color: Theme.of(context).primaryColor);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: getCompletionIcon(completion, context),
      title: Text(title),
      subtitle: Text(text),
      trailing: getCompletionWidget(completion, ref),
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
