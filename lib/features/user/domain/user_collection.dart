import 'package:exercise_companion/features/accessory/domain/accessory_db.dart';
import 'package:exercise_companion/features/pet/data/pet_db_provider.dart';
import 'package:exercise_companion/features/pet/domain/pet_db.dart';
import 'package:exercise_companion/features/store/domain/store_db.dart.delete';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pet/domain/user_pets_db.dart';
import '../../accessory/data/accessory_db_provider.dart';
import '../../pet/data/user_pet_db_provider.dart';
import '../../store/data/store_db_provider.dart';

import 'user.dart';

class UserCollection {
  //UserDB(this.ref);
  //final ProviderRef<UserDB> ref;
  UserCollection(users) : _users = users;
  final List<User> _users;

  User getUser(int userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  User getUserByEmail(String email) {
    return _users.firstWhere((userData) => userData.email == email);
  }

  void addPurchasedItem(int userID, int itemID, int productId, int itemType) {
    final userPetDB = ref.watch(userPetDBProvider);

    User user = getUser(userID);
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
    final petDB = ref.watch(petDBProvider);

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
}