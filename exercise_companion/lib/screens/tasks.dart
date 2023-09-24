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
                title: "Task 1", text: "Do X Y Z", completion: false),
            TaskViewWidget(title: "Task 2", text: "Do A B C", completion: true),
          ],
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }
}
