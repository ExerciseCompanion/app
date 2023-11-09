import '../presentation/task_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_task.dart';

class UserTaskCollection {
  //UserTaskDB(this.ref);
  //final ProviderRef<UserTaskDB> ref;
  UserTaskCollection(userTasks) : _userTasks = userTasks;
  final List<UserTask> _userTasks;

  UserTask getTask(int taskID) {
    return _userTasks.firstWhere((task) => task.id == taskID);
  }

  List<UserTask> getTasks(int userID) {
    return _userTasks.where((task) => task.userID == userID).toList();
  }

  List<Widget> getTaskWidgets(int userID) {
    List<UserTask> tasks = getTasks(userID);
    List<Widget> widgets = [];

    for (UserTask task in tasks) {
      widgets.add(TaskViewWidget(
        title: task.title,
        text: task.description,
        completion: task.status,
        taskID: task.id,
      ));
      widgets.add(const Divider());
    }

    return widgets;
  }
}

//UserTaskDB userTasksDB = UserTaskDB();

