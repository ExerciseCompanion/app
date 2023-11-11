import 'package:exercise_companion/features/store/domain/store_collection.dart';
import 'package:exercise_companion/features/store/domain/store_db.dart.delete';
// import 'package:exercise_companion/features/user/domain/user_db.dart';
// import 'package:exercise_companion/features/task/domain/user_task_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../../all_data_provider.dart';
import '../../user/domain/user_collection.dart';
import 'store_provider.dart';
import '../../user/data/user_provider.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final storeProvider = StateNotifierProvider<StoreNotifier, List<Widget>>((ref) {
  int currentUserID = ref.watch(currentUserIDProvider);
  // final userDB = ref.watch(userDBProvider);
  // final storeDB = ref.read(storeDBProvider);

  final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
  return asyncAllData.when(
      data: (allData) => StoreNotifier(currentUserID, allData),
      loading: () => StoreNotifier(currentUserID, AllData.empty()),
      error: (error, st) => StoreNotifier(currentUserID, AllData.empty()));

  //return StoreNotifier(currentUserID, userDB, storeDB);
});

class StoreNotifier extends StateNotifier<List<Widget>> {
  int currentUserID;
  AllData allData;
  // UserDB userDB;
  // StoreDB storeDB;

  StoreNotifier(
      this.currentUserID, this.allData) //), this.userDB, this.storeDB)
      : super([]) {
    refresh();
  }

  // definately safer to include int cost in case of cost change on db unreflected in app
  // potental null during id search, etc...
  void purchase(int itemID, int productId, int itemType, int cost) {
    UserCollection userDB = UserCollection(allData.users);

    if (userDB.getUser(currentUserID).currency >= cost) {
      
      userDB.getUser(currentUserID).currency -= cost;
      userDB.addPurchasedItem(currentUserID, itemID, productId, itemType);
    } else {
      print("Insufficent Funds");
    }
    refresh();
  }

  void refresh() {
    UserCollection userDB = UserCollection(allData.users);
    StoreCollection storeDB = StoreCollection(allData.users);

    state = storeDB.getShopWidgetsByStoreDatas(
        userDB.getUnPurcahsedItems(currentUserID, storeDB));
  }
}
