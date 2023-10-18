import '../elements/task_view.dart';
import 'package:flutter/material.dart';

class UserTaskData {
  UserTaskData({
    required this.id,
    required this.userID,
    //required this.taskID,
    required this.title,
    required this.description,
    //required this.rewardAccepted
    required this.reward,
    required this.status,
  });

  int id;
  int userID;
  String title;
  String description;
  int reward;
  int status; // enum 0: in progress, 1: completed but not claimed, 2: claimed
  //bool rewardAccepted;
}

class UserTaskDB {
  final List<UserTaskData> _userTasks = [
    UserTaskData(
        id: 0,
        userID: 0,
        title: "Step",
        description: "Walk 200 Steps",
        reward: 10,
        status: 0),
    UserTaskData(
        id: 1,
        userID: 0,
        title: "Pet",
        description: "Interact with your pet",
        reward: 10,
        status: 1),
    UserTaskData(
        id: 2,
        userID: 0,
        title: "Accessorize",
        description: "Change your pet's accessory",
        reward: 10,
        status: 2),
    //rewardAccepted: false),
  ];

  UserTaskData getTask(int taskID) {
    return _userTasks.firstWhere((task) => task.id == taskID);
  }

  List<UserTaskData> getTasks(int userID) {
    return _userTasks.where((task) => task.userID == userID).toList();
  }

  List<Widget> getTaskWidgets(int userID) {
    List<UserTaskData> tasks = getTasks(userID);
    List<Widget> widgets = [];

    for (UserTaskData task in tasks) {
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

UserTaskDB userTasksDB = UserTaskDB();
