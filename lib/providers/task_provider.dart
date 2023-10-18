import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_task_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final taskProvider = StateNotifierProvider<TaskNotifier, List<Widget>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<Widget>> {
  TaskNotifier() : super([]) {
    refresh();
  }

  void claim(int taskID) {
    userTasksDB.getTask(taskID).status = 2;
    //userTasksDB.getTask(taskID).userID // current user
    userDB.getUser(currentUserID).currency +=
        userTasksDB.getTask(taskID).reward;
    refresh();
  }

  void refresh() {
    state = userTasksDB.getTaskWidgets(currentUserID);
  }
}
