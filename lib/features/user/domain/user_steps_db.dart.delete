import 'dart:collection';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:exercise_companion/features/user/domain/user_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  UserStepsDB(this.ref);
  final ProviderRef<UserStepsDB> ref;

  final List<UserStepsData> _userSteps = [
    UserStepsData(id: 0, userID: 0, date: "10/24/2023", steps: 10),
    UserStepsData(id: 1, userID: 0, date: "10/23/2023", steps: 5),
    UserStepsData(id: 2, userID: 0, date: "10/22/2023", steps: 20),
    UserStepsData(id: 3, userID: 0, date: "10/21/2023", steps: 21),
    UserStepsData(id: 4, userID: 0, date: "10/20/2023", steps: 22),
    UserStepsData(id: 5, userID: 0, date: "10/19/2023", steps: 23),
    UserStepsData(id: 6, userID: 0, date: "10/18/2023", steps: 24),
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
            stepLog.userID == userID && datesMap.containsKey(stepLog.date))
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

  int getTodaysSteps(userID) {
    final DateTime currentDate = DateTime.now();
    final String date = DateFormat('MM/dd/yyyy').format(currentDate);
    final int steps = _userSteps
        .firstWhere(
            (stepLog) => stepLog.userID == userID && stepLog.date == date,
            orElse: () => UserStepsData(id: -1, userID: -1, date: "", steps: 0))
        .steps;

    return steps;
  }

  UserStepsData getLastStepEntry(int userID) {
    // ASSUME THAT THE LAST ENTRY IS THE LATEST STEP COUNTER
    return _userSteps.lastWhere((element) => element.userID == userID);
  }

  // Must be idempotent, i.e. state based
  double calculatePetHealthBasedOnLastStepEntry(int userID) {
    int recommendedSteps = 100;
    num ratio = (getLastStepEntry(userID).steps / recommendedSteps)
        .clamp(0, recommendedSteps);
    return ratio.toDouble();
  }
}

//UserStepsDB userStepsDB = UserStepsDB();

final userStepsDBProvider = Provider<UserStepsDB>((ref) {
  return UserStepsDB(ref);
});
