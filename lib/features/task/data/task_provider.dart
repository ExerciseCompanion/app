import 'package:exercise_companion/features/user/domain/user_db.dart';
import 'package:exercise_companion/features/task/domain/user_task_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import './user_task_db_provider.dart';
import '../../user/data/user_db_provider.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final taskProvider = StateNotifierProvider<TaskNotifier, List<Widget>>((ref) {
  int currentUserID = ref.read(currentUserIDProvider);
  final userDB = ref.read(userDBProvider);
  final userTasksDB = ref.read(userTasksDBProvider);

  return TaskNotifier(currentUserID, userDB, userTasksDB);
});

class TaskNotifier extends StateNotifier<List<Widget>> {
  int currentUserID;
  UserDB userDB;
  UserTaskDB userTasksDB;

  TaskNotifier(this.currentUserID, this.userDB, this.userTasksDB) : super([]) {
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