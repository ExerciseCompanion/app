import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../../all_data_provider.dart';
import '../../user/domain/user_collection.dart';
import '../presentation/pet_img.dart';
import '../../user/data/user_provider.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final homePetProvider = StateNotifierProvider<HomePetNotifier, PetImg>((ref) {
  int currentUserID = ref.read(currentUserIDProvider);
  //final userDB = ref.read(userDatabaseProvider);

  final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
  return asyncAllData.when(
      data: (allData) => HomePetNotifier(currentUserID, allData),
      loading: () => HomePetNotifier(currentUserID, AllData.empty()),
      error: (error, st) => HomePetNotifier(currentUserID, AllData.empty()));

  //return HomePetNotifier(currentUserID, userDB);
});

class HomePetNotifier extends StateNotifier<PetImg> {
  int currentUserID;
  // UserDB userDB;
  AllData allData;

  HomePetNotifier(this.currentUserID, this.allData)
      : super(PetImg(background: "", pet: "", accessory: "")) {
    refresh();
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
