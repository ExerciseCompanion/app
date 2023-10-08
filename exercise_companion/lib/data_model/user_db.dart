import 'package:exercise_companion/data_model/accessory_db.dart';
import 'package:exercise_companion/data_model/pet_db.dart';

import 'user_pets_db.dart';
import 'user_task_db.dart';
import 'user_steps_db.dart';
import 'user_pets_db.dart';
import 'accessory_db.dart';

/// The data associated with users.
class UserData {
  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.currency,
    required this.mainPetID,
    required this.backdropAsset,
    required this.taskIDs,
    required this.stepIDs,
    required this.petInventoryIDs,
    required this.accessoryInventoryIDs,
  });

  int id;
  String username;
  String email;

  int currency;
  int mainPetID;
  String backdropAsset;

  List<int> taskIDs;
  List<int> stepIDs;

  List<int> petInventoryIDs;
  List<int> accessoryInventoryIDs;
}

class UserDB {
  final List<UserData> _users = [
    UserData(
        id: 0,
        username: '@cleeuh',
        email: 'clee48@hawaii.edu',
        currency: 0,
        mainPetID: 0,
        backdropAsset: "images/backgrounds/test.jpg",
        taskIDs: [0],
        stepIDs: [0],
        petInventoryIDs: [0],
        accessoryInventoryIDs: [0]),
  ];

  UserData getUser(int userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  Map<String, String> getMainPetAsset(userID) {
    int mainPetID = userDB.getUser(userID).mainPetID;
    UserPetData userPet = userPetDB.getPet(mainPetID);
    int petID = userPet.petID;
    int? accessoryID = userPet.accessoryID;

    Map<String, String> assets = {
      "accessory": accessoryID == null
          ? ""
          : accessoryDB.getAccessory(accessoryID).asset,
      "pet": petDB.getPet(userPet.petID).asset,
      "background": userDB.getUser(userID).backdropAsset
    };

    return assets;
  }
  /*List<UserData> getUsers(List<String> userIDs) {
    return _users.where((userData) => userIDs.contains(userData.id)).toList();
  }

  // Return the userIDs of users who are in the same Chapter(s) as [userID].
  // First, get all of the chapterIDs that this [userID] is associated with.
  // Then build the set of all userIDs associated with the chapterIDs.
  List<String> getAssociatedUserIDs(String userID) {
    List<String> chapterIDs = chapterDB.getAssociatedChapterIDs(userID);
    Set<String> userIDs = {};
    for (var chapterID in chapterIDs) {
      userIDs.addAll(chapterDB.getAssociatedUserIDs(chapterID));
    }
    return userIDs.toList();
  }*/
}

/// The singleton instance providing access to all user data for clients.
UserDB userDB = UserDB();

/// The currently logged in user.
int currentUserID = 0;
