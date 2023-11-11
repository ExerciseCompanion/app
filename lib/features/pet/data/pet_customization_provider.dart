import 'package:exercise_companion/features/user/data/user_database.dart';
// import 'package:exercise_companion/features/user/domain/user_db.dart';
// import 'package:exercise_companion/features/pet/domain/user_pets_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../../accessory/domain/accessory_collection.dart';
import '../../all_data_provider.dart';
import '../../user/domain/user_collection.dart';
import '../domain/pet_collection.dart';
import '../domain/user_pets_collection.dart';
import '../presentation/pet_img.dart';
import 'user_pet_provider.dart';
import '../../user/data/user_provider.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final customizePetProvider =
    StateNotifierProvider<CustomizePetNotifier, PetImg>((ref) {
  int currentUserID = ref.read(currentUserIDProvider);
  //final userDB = ref.watch(userDatabaseProvider);
  //final userPetDB = ref.watch(userPetDatabaseProvider);

  final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
  return asyncAllData.when(
      data: (allData) => CustomizePetNotifier(currentUserID, allData),
      loading: () => CustomizePetNotifier(currentUserID, AllData.empty()),
      error: (error, st) =>
          CustomizePetNotifier(currentUserID, AllData.empty()));

  //return CustomizePetNotifier(currentUserID, userDB, userPetDB);
});

class CustomizePetNotifier extends StateNotifier<PetImg> {
  int currentUserID;
  AllData allData;
  //final userDB;
  //final userPetDB;

  CustomizePetNotifier(
      this.currentUserID, this.allData) //, this.userDB, this.userPetDB)
      : super(PetImg(background: "", pet: "", accessory: "")) {
    refresh();
  }

  void setAccessory(int accessoryID) {
    print("Selected accessory ${accessoryID}");
    UserCollection userDB = UserCollection(allData.users);
    UserPetCollection userPetDB = UserPetCollection(allData.userPets);
    AccessoryCollection accessoryDB = AccessoryCollection(allData.accessories);
    PetCollection petDB = PetCollection(allData.pets);

    userDB.setMainPetAccessory(currentUserID, accessoryID, userPetDB);

    Map<String, String> assets =
        userDB.getMainPetAsset(currentUserID, userPetDB, accessoryDB, petDB);
    state = PetImg(
        background: assets["background"] ?? "",
        pet: assets["pet"] ?? "",
        accessory: assets["accessory"] ?? "");
  }

  void refresh() {
    UserCollection userDB = UserCollection(allData.users);
    UserPetCollection userPetDB = UserPetCollection(allData.userPets);
    AccessoryCollection accessoryDB = AccessoryCollection(allData.accessories);
    PetCollection petDB = PetCollection(allData.pets);

    Map<String, String> assets =
        userDB.getMainPetAsset(currentUserID, userPetDB, accessoryDB, petDB);
    state = PetImg(
        background: assets["background"] ?? "",
        pet: assets["pet"] ?? "",
        accessory: assets["accessory"] ?? "");
  }
}
