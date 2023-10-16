import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_task_db.dart';
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
          children: userTasksDB.getTaskWidgets(currentUserID),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BaseBottomNavigationBar());
  }
}