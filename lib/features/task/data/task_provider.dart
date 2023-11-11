// import 'package:exercise_companion/features/user/domain/user_db.dart';
// import 'package:exercise_companion/features/task/domain/user_task_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../../all_data_provider.dart';
import '../../user/data/user_database.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../domain/user_task.dart';
import '../domain/user_task_collection.dart';
import 'user_task_database.dart';
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
      data: (allData) => TaskNotifier(currentUserID, ref, allData),
      loading: () => TaskNotifier(currentUserID, ref, AllData.empty()),
      error: (error, st) => TaskNotifier(currentUserID, ref, AllData.empty()));

  //return TaskNotifier(currentUserID, allData); // userDB, userTasksDB);
});

class TaskNotifier extends StateNotifier<List<Widget>> {
  int currentUserID;
  // UserDB userDB;
  // UserTaskDB userTasksDB;
  final ref;
  AllData allData;

  TaskNotifier(this.currentUserID, this.ref, this.allData) : super([]) {
    refresh();
  }

  void claim(int taskID) {
    UserCollection userDB = UserCollection(allData.users);
    UserTaskCollection userTaskDB = UserTaskCollection(allData.userTasks);

    UserTask task = userTaskDB.getTask(taskID);
    UserTaskDatabase userTaskDataBase = ref.watch(userTaskDatabaseProvider);
    userTaskDataBase.setUserTask(UserTask(
      id: task.id,
      userID: task.userID,
      title: task.title,
      description: task.description,
      reward: task.reward,
      status: 2,
    ));

    User user = userDB.getUser(currentUserID);
    UserDatabase userDatabase = ref.watch(userDatabaseProvider);
    userDatabase.setUser(User(
      id: user.id,
      username: user.username,
      email: user.email,
      currency: user.currency + userTaskDB.getTask(taskID).reward,
      mainPetID: user.mainPetID,
      backdropAsset: user.backdropAsset,
      purchasedItemsIDs: user.purchasedItemsIDs,
      petInventoryIDs: user.petInventoryIDs,
      accessoryInventoryIDs: user.accessoryInventoryIDs,
    ));

    // userTaskDB.getTask(taskID).status = 2;
    // userDB.getUser(currentUserID).currency += userTaskDB.getTask(taskID).reward;
    refresh();
  }

  void refresh() {
    UserTaskCollection userTaskDB = UserTaskCollection(allData.userTasks);

    state = userTaskDB.getTaskWidgets(currentUserID);
  }
}
