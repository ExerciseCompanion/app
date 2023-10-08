class UserStepsData {
  UserStepsData(
      {required this.id,
      required this.userID,
      required this.day,
      required this.steps});

  int id;
  int userID;
  String day;
  int steps;
}

class UserStepsDB {
  final List<UserStepsData> _userSteps = [
    UserStepsData(id: 0, userID: 0, day: "10/7/2023", steps: 10),
    UserStepsData(id: 1, userID: 0, day: "10/6/2023", steps: 5),
    UserStepsData(id: 2, userID: 0, day: "10/5/2023", steps: 20),
  ];

  /*UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }*/
}

UserStepsDB userStepsDB = UserStepsDB();
