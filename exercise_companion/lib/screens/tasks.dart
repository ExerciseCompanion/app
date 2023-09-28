import 'package:flutter/material.dart';
import '../templates/appbar.dart';
import '../templates/bottombar.dart';
import '../elements/task_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Tasks",
        ),
        body: ListView(
          children: <Widget>[
            TaskViewWidget(
                title: "Step", text: "Walk 200 Steps", completion: false),
            const Divider(),
            TaskViewWidget(
                title: "Pet", text: "Interact with your Pet", completion: true),
          ],
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }
}
