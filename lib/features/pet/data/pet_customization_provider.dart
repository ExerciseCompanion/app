import 'package:exercise_companion/features/user/data/user_database.dart';
// import 'package:exercise_companion/features/user/domain/user_db.dart';
// import 'package:exercise_companion/features/pet/domain/user_pets_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../../all_data_provider.dart';
import '../../user/domain/user_collection.dart';
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

    userDB.setMainPetAccessory(currentUserID, accessoryID);

    Map<String, String> assets = userDB.getMainPetAsset(currentUserID);
    state = PetImg(
        background: assets["background"] ?? "",
        pet: assets["pet"] ?? "",
        accessory: assets["accessory"] ?? "");
  }

  void refresh() {
    UserCollection userDB = UserCollection(allData.users);

    Map<String, String> assets = userDB.getMainPetAsset(currentUserID);
    state = PetImg(
        background: assets["background"] ?? "",
        pet: assets["pet"] ?? "",
        accessory: assets["accessory"] ?? "");
  }
}
