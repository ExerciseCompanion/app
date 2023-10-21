import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_pets_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final selectPetProvider =
    StateNotifierProvider<SelectPetNotifier, List<Widget>>((ref) {
  int currentUserID = ref.read(currentUserIDProvider);
  final userDB = ref.watch(userDBProvider);
  final userPetDB = ref.read(userPetDBProvider);

  return SelectPetNotifier(currentUserID, userDB, userPetDB);
});

class SelectPetNotifier extends StateNotifier<List<Widget>> {
  int currentUserID;
  UserDB userDB;
  UserPetDB userPetDB;

  SelectPetNotifier(this.currentUserID, this.userDB, this.userPetDB)
      : super([]) {
    refresh();
  }

  void select(int userPetId) {
    print("Selected Pet ${userPetId}");
    userDB.setMainPet(currentUserID, userPetId);
    state = userPetDB.getPetWidgets(
        currentUserID, userDB.getUser(currentUserID).mainPetID);
  }

  void refresh() {
    state = userPetDB.getPetWidgets(
        currentUserID, userDB.getUser(currentUserID).mainPetID);
  }
}
