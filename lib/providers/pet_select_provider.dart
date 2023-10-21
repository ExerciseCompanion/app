import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_pets_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final selectPetProvider =
    StateNotifierProvider<SelectPetNotifier, List<Widget>>((ref) {
  int currentUserID = ref.watch(currentUserIDProvider);
  return SelectPetNotifier(currentUserID);
});

class SelectPetNotifier extends StateNotifier<List<Widget>> {
  int currentUserID;

  SelectPetNotifier(this.currentUserID) : super([]) {
    refresh();
  }

  void select(int userPetId) {
    print("Selected Pet ${userPetId}");
    userDB.setMainPet(currentUserID, userPetId);
    state = userPetDB.getPetWidgets(currentUserID);
  }

  void refresh() {
    state = userPetDB.getPetWidgets(currentUserID);
  }
}
