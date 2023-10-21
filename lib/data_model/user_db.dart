import 'package:exercise_companion/data_model/accessory_db.dart';
import 'package:exercise_companion/data_model/pet_db.dart';
import 'package:exercise_companion/data_model/store_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_pets_db.dart';

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
  UserDB(this.ref);
  final ProviderRef<UserDB> ref;

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
        accessoryInventoryIDs: [0, 1, 1]),
    UserData(
        id: 1,
        username: '@fakeuser',
        email: 'fakeuser@hawaii.edu',
        currency: 0,
        mainPetID: 0,
        backdropAsset: "images/backgrounds/test.jpg",
        //taskIDs: [0], // no need doubly linked
        //stepIDs: [0], // no need doubly linked
        purchasedItemsIDs: [],
        petInventoryIDs: [1],
        accessoryInventoryIDs: [0, 1]),
  ];

  UserData getUser(int userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  UserData getUserByEmail(String email) {
    return _users.firstWhere((userData) => userData.email == email);
  }

  /*bool isAccessoryOwned(int userID) {

    return false;
  }*/

  void addPurchasedItem(int userID, int itemID, int productId, int itemType) {
    final userPetDB = ref.watch(userPetDBProvider);

    UserData user = getUser(userID);
    user.purchasedItemsIDs.add(itemID);
    if (itemType == 0) {
      // accessory
      user.accessoryInventoryIDs.add(productId);
    } else if (itemType == 1) {
      // pet
      //user.petInventoryIDs.add(productId);
      userPetDB.addPet(userID, productId);
    }
  }

  List<StoreData> getUnPurcahsedItems(int userID) {
    final storeDB = ref.watch(storeDBProvider);

    Set<int> items = getUser(userID).purchasedItemsIDs.toSet();
    Set<int> allItems = storeDB.getAllStoreItemIDs().toSet();
    Set<int> nonPurchasedIds = allItems.difference(items);

    return storeDB.getStoreItemsByIDs(nonPurchasedIds.toList());
  }

  List<AccessoryData> getAccessories(int userID) {
    final accessoryDB = ref.watch(accessoryDBProvider);

    List<AccessoryData> accessories = [];
    List<int> accessoryIDs = getUser(userID).accessoryInventoryIDs;
    for (int accessoryID in accessoryIDs) {
      accessories.add(accessoryDB.getAccessory(accessoryID));
    }

    return accessories;
    //return accessoryDB.getAccessories(userDB.getUser(userID).accessoryInventoryIDs);
    //return accessoryDB.getAccessories();
  }

  Map<String, String> getMainPetAsset(userID) {
    final userPetDB = ref.watch(userPetDBProvider);
    final accessoryDB = ref.watch(accessoryDBProvider);

    int mainPetID = getUser(userID).mainPetID;
    UserPetData userPet = userPetDB.getPet(mainPetID);
    int? accessoryID = userPet.accessoryID;

    Map<String, String> assets = {
      "accessory": accessoryID == null
          ? ""
          : accessoryDB.getAccessory(accessoryID).asset,
      "pet": petDB.getPet(userPet.petID).asset,
      "background": getUser(userID).backdropAsset
    };

    return assets;
  }

  void setMainPetAccessory(int userID, int acessoryID) {
    final userPetDB = ref.read(userPetDBProvider);

    int mainPetId = getUser(userID).mainPetID;
    userPetDB.getPet(mainPetId).accessoryID = acessoryID;
  }

  void setMainPet(int userId, int mainPetId) {
    _users.firstWhere((element) => element.id == userId).mainPetID = mainPetId;
  }

  bool checkUserEmail(String email) {
    //_users.firstWhere((element) => element.email == email, orElse: () => -1);
    try {
      _users.firstWhere((element) => element.email == email);
      return true;
    } catch (e) {
      return false;
    }
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
//UserDB userDB = UserDB();

/// The currently logged in user.
//int currentUserID = 0;

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});

final currentUserIDProvider = StateProvider<int>((ref) {
  return 0;
});
