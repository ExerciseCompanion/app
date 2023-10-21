import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_pets_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../elements/pet.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final customizePetProvider =
    StateNotifierProvider<CustomizePetNotifier, Pet>((ref) {
  int currentUserID = ref.read(currentUserIDProvider);
  final userDB = ref.watch(userDBProvider);
  final userPetDB = ref.watch(userPetDBProvider);

  return CustomizePetNotifier(currentUserID, userDB, userPetDB);
});

class CustomizePetNotifier extends StateNotifier<Pet> {
  int currentUserID;
  UserDB userDB;
  UserPetDB userPetDB;

  CustomizePetNotifier(this.currentUserID, this.userDB, this.userPetDB)
      : super(Pet(background: "", pet: "", accessory: "")) {
    refresh();
  }

  void setAccessory(int accessoryID) {
    print("Selected accessory ${accessoryID}");
    userDB.setMainPetAccessory(currentUserID, accessoryID);

    Map<String, String> assets = userDB.getMainPetAsset(currentUserID);
    state = Pet(
        background: assets["background"] ?? "",
        pet: assets["pet"] ?? "",
        accessory: assets["accessory"] ?? "");
  }

  void refresh() {
    Map<String, String> assets = userDB.getMainPetAsset(currentUserID);
    state = Pet(
        background: assets["background"] ?? "",
        pet: assets["pet"] ?? "",
        accessory: assets["accessory"] ?? "");
  }
}
