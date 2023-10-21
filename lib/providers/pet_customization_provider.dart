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
  int currentUserID = ref.watch(currentUserIDProvider);
  return CustomizePetNotifier(currentUserID);
});

class CustomizePetNotifier extends StateNotifier<Pet> {
  int currentUserID;

  CustomizePetNotifier(this.currentUserID)
      : super(Pet(background: "", pet: "", accessory: "")) {
    refresh();
  }

  void setAccessory(int accessoryID) {
    print("Selected accessory ${accessoryID}");
    userPetDB.setMainPetAccessory(currentUserID, accessoryID);

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
