//import 'package:exercise_companion/features/user/domain/user_db.dart';
//import 'package:exercise_companion/features/pet/domain/user_pets_db.dart';
import 'package:exercise_companion/features/all_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../accessory/domain/accessory_collection.dart';
import '../../user/data/user_database.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../domain/pet_collection.dart';
import '../domain/user_pets_collection.dart';
import '../../user/data/user_provider.dart';
import '../../all_data_provider.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final selectPetProvider =
    StateNotifierProvider<SelectPetNotifier, List<Widget>>((ref) {
  int currentUserID = ref.read(currentUserIDProvider);
  // final AsyncValue<User> userDB = ref.watch(userDatabaseProvider);
  // final  AsyncValue<User> userPetDB = ref.read(userPetDatabaseProvider);
  final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
  return asyncAllData.when(
      data: (allData) => SelectPetNotifier(currentUserID, ref, allData),
      loading: () => SelectPetNotifier(currentUserID, ref, AllData.empty()),
      error: (error, st) =>
          SelectPetNotifier(currentUserID, ref, AllData.empty()));

  //return SelectPetNotifier(currentUserID, asyncAllData); //, userPetDB);
});

class SelectPetNotifier extends StateNotifier<List<Widget>> {
  int currentUserID;
  AllData allData;
  StateNotifierProviderRef ref;
  //UserDatabase asyncAllData;
  //UserPetDatabase userPetDB;

  SelectPetNotifier(
      this.currentUserID, this.ref, this.allData) //, this.userPetDB)
      : super([]) {
    refresh();
  }

  void select(int userPetId) {
    print("Selected Pet ${userPetId}");

    UserCollection userDB = UserCollection(allData.users);
    UserPetCollection userPetDB = UserPetCollection(allData.userPets);
    PetCollection petDB = PetCollection(allData.pets);
    AccessoryCollection accessoryDB = AccessoryCollection(allData.accessories);

    //userDB.setMainPet(currentUserID, userPetId);
    User user = userDB.getUser(currentUserID);
    UserDatabase userDatabase = ref.watch(userDatabaseProvider);
    userDatabase.setUser(User(
      id: user.id,
      username: user.username,
      email: user.email,
      currency: user.currency,
      mainPetID: userPetId,
      backdropAsset: user.backdropAsset,
      purchasedItemsIDs: user.purchasedItemsIDs,
      petInventoryIDs: user.petInventoryIDs,
      accessoryInventoryIDs: user.accessoryInventoryIDs,
    ));

    state = userPetDB.getPetWidgets(currentUserID,
        userDB.getUser(currentUserID).mainPetID, petDB, accessoryDB);
  }

  void refresh() {
    UserCollection userDB = UserCollection(allData.users);
    UserPetCollection userPetDB = UserPetCollection(allData.userPets);
    PetCollection petDB = PetCollection(allData.pets);
    AccessoryCollection accessoryDB = AccessoryCollection(allData.accessories);

    state = userPetDB.getPetWidgets(currentUserID,
        userDB.getUser(currentUserID).mainPetID, petDB, accessoryDB);
  }
}
