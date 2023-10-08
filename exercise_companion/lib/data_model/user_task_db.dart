class UserTaskData {
  UserTaskData(
      {required this.id,
      required this.userID,
      //required this.taskID,
      required this.rewardAccepted});

  int id;
  int userID;
  bool rewardAccepted;
}

class UserTaskDB {
  final List<UserTaskData> _userTasks = [
    UserTaskData(id: 0, userID: 0, rewardAccepted: false),
  ];

  List<UserTaskData> getTasks(String userID) {
    return _userTasks.where((task) => task.userID == userID).toList();
  }
}

UserTaskDB userTasksDB = UserTaskDB();
