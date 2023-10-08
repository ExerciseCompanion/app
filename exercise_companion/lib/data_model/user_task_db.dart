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

  /*UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }*/
}

UserTaskDB userTasksDB = UserTaskDB();
