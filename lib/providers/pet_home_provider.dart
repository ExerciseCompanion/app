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

final homePetProvider = StateNotifierProvider<HomePetNotifier, Pet>((ref) {
  int currentUserID = ref.watch(currentUserIDProvider);
  return HomePetNotifier(currentUserID);
});

class HomePetNotifier extends StateNotifier<Pet> {
  int currentUserID;

  HomePetNotifier(this.currentUserID)
      : super(Pet(background: "", pet: "", accessory: "")) {
    refresh();
  }

  void refresh() {
    Map<String, String> assets = userDB.getMainPetAsset(currentUserID);
    state = Pet(
        background: assets["background"] ?? "",
        pet: assets["pet"] ?? "",
        accessory: assets["accessory"] ?? "");
  }
}
