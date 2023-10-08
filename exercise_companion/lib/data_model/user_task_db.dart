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
    required this.status,
  });

  int id;
  int userID;
  String title;
  String description;
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
        status: 0),
    UserTaskData(
        id: 1,
        userID: 0,
        title: "Pet",
        description: "Interact with your pet",
        status: 1),
    UserTaskData(
        id: 2,
        userID: 0,
        title: "Accessorize",
        description: "Change your pet's accessory",
        status: 2),
    //rewardAccepted: false),
  ];

  List<UserTaskData> getTasks(int userID) {
    return _userTasks.where((task) => task.userID == userID).toList();
  }

  List<Widget> getTaskWidgets(int userID) {
    List<UserTaskData> tasks = getTasks(userID);
    List<Widget> widgets = [];

    for (UserTaskData task in tasks) {
      widgets.add(TaskViewWidget(
          title: task.title, text: task.description, completion: task.status));
      widgets.add(const Divider());
    }

    return widgets;
  }
}

UserTaskDB userTasksDB = UserTaskDB();
