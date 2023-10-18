import 'dart:ffi';

import 'package:exercise_companion/data_model/accessory_db.dart';
import 'package:exercise_companion/data_model/pet_db.dart';
import 'package:exercise_companion/data_model/store_db.dart';

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
    //required this.taskIDs,
    //required this.stepIDs,
    required this.purchasedItemsIDs,
    required this.petInventoryIDs,
    required this.accessoryInventoryIDs,
  });

  int id;
  String username;
  String email;

  int currency;
  int mainPetID;
  String backdropAsset;

  //List<int> taskIDs;
  //List<int> stepIDs;
  List<int> purchasedItemsIDs;

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
        //taskIDs: [0, 1, 2, 3, 4, 5, 6], // no need doubly linked
        //stepIDs: [0, 1, 2, 3, 4, 5, 6], // no need doubly linked
        purchasedItemsIDs: [],
        petInventoryIDs: [0],
        accessoryInventoryIDs: [0, 0, 1]),
    UserData(
        id: 1,
        username: '@fakeuser',
        email: 'fakeuser@hawaii.edu',
        currency: 0,
        mainPetID: 0,
        backdropAsset: "images/backgrounds/test.jpg",
        //taskIDs: [0], // no need doubly linked
        //stepIDs: [0], // no need doubly linked
        purchasedItemsIDs: [0],
        petInventoryIDs: [1],
        accessoryInventoryIDs: [0, 0]),
  ];

  UserData getUser(int userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  /*bool isAccessoryOwned(int userID) {

    return false;
  }*/

  List<StoreData> getUnPurcahsedItems(int userID) {
    Set<int> items = userDB.getUser(userID).purchasedItemsIDs.toSet();
    Set<int> allItems = storeDB.getAllStoreItemIDs().toSet();
    Set<int> nonPurchasedIds = allItems.difference(items);

    return storeDB.getStoreItemsByIDs(nonPurchasedIds.toList());
  }

  List<AccessoryData> getAccessories(int userID) {
    List<AccessoryData> accessories = [];
    List<int> accessoryIDs = userDB.getUser(userID).accessoryInventoryIDs;
    for (int accessoryID in accessoryIDs) {
      accessories.add(accessoryDB.getAccessory(accessoryID));
    }

    return accessories;
    //return accessoryDB.getAccessories(userDB.getUser(userID).accessoryInventoryIDs);
    //return accessoryDB.getAccessories();
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

  void setMainPet(int userId, int mainPetId) {
    _users.firstWhere((element) => element.id == userId).mainPetID = mainPetId;
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
