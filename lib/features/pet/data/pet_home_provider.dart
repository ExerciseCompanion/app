import 'package:exercise_companion/features/user/domain/user_db.dart';
import 'package:exercise_companion/features/pet/domain/user_pets_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../presentation/pet_img.dart';
import '../../user/data/user_db_provider.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final homePetProvider = StateNotifierProvider<HomePetNotifier, Pet>((ref) {
  int currentUserID = ref.read(currentUserIDProvider);
  final userDB = ref.read(userDBProvider);

  return HomePetNotifier(currentUserID, userDB);
});

class HomePetNotifier extends StateNotifier<Pet> {
  int currentUserID;
  UserDB userDB;

  HomePetNotifier(this.currentUserID, this.userDB)
      : super(PetImg(background: "", pet: "", accessory: "")) {
    refresh();
  }

  void refresh() {
    Map<String, String> assets = userDB.getMainPetAsset(currentUserID);
    state = PetImg(
        background: assets["background"] ?? "",
        pet: assets["pet"] ?? "",
        accessory: assets["accessory"] ?? "");
  }
}
