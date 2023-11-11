import 'package:exercise_companion/features/accessory/domain/accessory_collection.dart';
import 'package:exercise_companion/features/pet/domain/pet_collection.dart';
import 'package:exercise_companion/features/store/domain/store_collection.dart';
import 'package:exercise_companion/features/store/domain/store_db.dart.delete';
import 'package:exercise_companion/features/user/data/user_database.dart';
// import 'package:exercise_companion/features/user/domain/user_db.dart';
// import 'package:exercise_companion/features/task/domain/user_task_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../../all_data_provider.dart';
import '../../pet/domain/user_pets_collection.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import 'store_provider.dart';
import '../../user/data/user_provider.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final storeProvider = StateNotifierProvider<StoreNotifier, List<Widget>>((ref) {
  int currentUserID = ref.watch(currentUserIDProvider);
  // final userDB = ref.watch(userDBProvider);
  // final storeDB = ref.read(storeDBProvider);

  final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
  return asyncAllData.when(
      data: (allData) => StoreNotifier(currentUserID, ref, allData),
      loading: () => StoreNotifier(currentUserID, ref, AllData.empty()),
      error: (error, st) => StoreNotifier(currentUserID, ref, AllData.empty()));

  //return StoreNotifier(currentUserID, userDB, storeDB);
});

class StoreNotifier extends StateNotifier<List<Widget>> {
  int currentUserID;
  AllData allData;
  final ref;
  // UserDB userDB;
  // StoreDB storeDB;

  StoreNotifier(this.currentUserID, this.ref,
      this.allData) //), this.userDB, this.storeDB)
      : super([]) {
    refresh();
  }

  // // definately safer to include int cost in case of cost change on db unreflected in app
  // // potental null during id search, etc...
  // Future<void> updateGarden({
  //   required Garden garden,
  //   required VoidCallback onSuccess,
  // }) async {
  //   state = const AsyncLoading();
  //   GardenDatabase gardenDatabase = ref.watch(gardenDatabaseProvider);
  //   final newState =
  //       await AsyncValue.guard(() => gardenDatabase.setGarden(garden));
  //   if (mounted) {
  //     state = newState;
  //   }
  //   // Weird. Can't use "if (state.hasValue)" below.
  //   if (!state.hasError) {
  //     onSuccess();
  //   }

  //   refresh();
  // }

  void purchase(int itemID, int productId, int itemType, int cost) {
    UserCollection userDB = UserCollection(allData.users);
    PetCollection petDB = PetCollection(allData.pets);
    UserPetCollection userPetDB = UserPetCollection(allData.userPets);

    if (userDB.getUser(currentUserID).currency >= cost) {
      User user = userDB.getUser(currentUserID);
      UserDatabase userDatabase = ref.watch(userDatabaseProvider);
      userDatabase.setUser(User(
        id: user.id,
        username: user.username,
        email: user.email,
        currency: user.currency - cost,
        mainPetID: user.mainPetID,
        backdropAsset: user.backdropAsset,
        purchasedItemsIDs: user.purchasedItemsIDs,
        petInventoryIDs: user.petInventoryIDs,
        accessoryInventoryIDs: user.accessoryInventoryIDs,
      ));

      //userDB.getUser(currentUserID).currency -= cost;
      userDB.addPurchasedItem(
          currentUserID, itemID, productId, itemType, userPetDB, petDB);
    } else {
      print("Insufficent Funds");
    }
    refresh();
  }

  void refresh() {
    UserCollection userDB = UserCollection(allData.users);
    StoreCollection storeDB = StoreCollection(allData.stores);
    AccessoryCollection accessoryDB = AccessoryCollection(allData.accessories);
    PetCollection petDB = PetCollection(allData.pets);

    state = storeDB.getShopWidgetsByStoreDatas(
        userDB.getUnPurcahsedItems(currentUserID, storeDB), accessoryDB, petDB);
  }
}
