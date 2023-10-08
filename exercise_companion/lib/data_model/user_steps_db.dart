import 'dart:collection';
import 'package:intl/intl.dart';
import 'package:exercise_companion/data_model/user_db.dart';

class UserStepsData {
  UserStepsData(
      {required this.id,
      required this.userID,
      required this.date,
      required this.steps});

  int id;
  int userID;
  String date;
  int steps;
}

class UserStepsDB {
  final List<UserStepsData> _userSteps = [
    UserStepsData(id: 0, userID: 0, date: "10/07/2023", steps: 10),
    UserStepsData(id: 1, userID: 0, date: "10/06/2023", steps: 5),
    UserStepsData(id: 2, userID: 0, date: "10/05/2023", steps: 20),
    UserStepsData(id: 3, userID: 0, date: "10/04/2023", steps: 21),
    UserStepsData(id: 4, userID: 0, date: "10/03/2023", steps: 22),
    UserStepsData(id: 5, userID: 0, date: "10/02/2023", steps: 23),
    UserStepsData(id: 6, userID: 0, date: "10/01/2023", steps: 24),
  ];

  /*UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }*/
  Map<String, int> getPastWeek(userID) {
    final DateTime currentDate = DateTime.now();
    List<DateTime> dates = [];
    Map<String, int> datesMap = {};

    for (int i = 0; i <= 6; i++) {
      DateTime date = currentDate.subtract(Duration(days: i));
      datesMap[DateFormat('MM/dd/yyyy').format(date)] = 0;
    }

    List<UserStepsData> stepLogs = _userSteps
        .where((stepLog) =>
            stepLog.userID == 0 && datesMap.containsKey(stepLog.date))
        .toList();

    for (UserStepsData log in stepLogs) {
      datesMap[log.date] = log.steps;
    }

    print(datesMap);
    return datesMap;
  }

  List<int> getPastWeekAsList(userID) {
    Map<String, int> dateMap = getPastWeek(userID);

    // To be honest, not sure if sorting is actually neccessary...
    List<String> sortedDateMapKeys = dateMap.keys.toList()..sort();
    List<int> sortedDateMapValues = sortedDateMapKeys
        .map((key) => dateMap[key])
        .toList()
        .where((item) => item != null)
        .cast<int>()
        .toList();

    print(sortedDateMapValues);
    return sortedDateMapValues;
  }
}

UserStepsDB userStepsDB = UserStepsDB();
