import 'package:exercise_companion/features/user/domain/user_db.dart';
import 'package:exercise_companion/features/task/domain/user_task_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../../all_data_provider.dart';
import '../../user/domain/user_collection.dart';
import '../domain/user_task_collection.dart';
import 'user_task_provider.dart';
import '../../user/data/user_provider.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final taskProvider = StateNotifierProvider<TaskNotifier, List<Widget>>((ref) {
  int currentUserID = ref.read(currentUserIDProvider);
  // final userDB = ref.read(userDBProvider);
  // final userTasksDB = ref.read(userTasksDBProvider);
  final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
  return asyncAllData.when(
      data: (allData) => TaskNotifier(currentUserID, allData),
      loading: () => TaskNotifier(currentUserID, AllData.empty()),
      error: (error, st) => TaskNotifier(currentUserID, AllData.empty()));

  //return TaskNotifier(currentUserID, allData); // userDB, userTasksDB);
});

class TaskNotifier extends StateNotifier<List<Widget>> {
  int currentUserID;
  // UserDB userDB;
  // UserTaskDB userTasksDB;
  AllData allData;

  TaskNotifier(this.currentUserID, this.allData) : super([]) {
    refresh();
  }

  void claim(int taskID) {
    UserCollection userDB = UserCollection(allData.users);
    UserTaskCollection userTaskDB = UserTaskCollection(allData.userTasks);

    userTaskDB.getTask(taskID).status = 2;
    //userTasksDB.getTask(taskID).userID // current user
    userDB.getUser(currentUserID).currency += userTaskDB.getTask(taskID).reward;
    refresh();
  }

  void refresh() {
    UserTaskCollection userTaskDB = UserTaskCollection(allData.userTasks);

    state = userTaskDB.getTaskWidgets(currentUserID);
  }
}
