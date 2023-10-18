import 'package:exercise_companion/data_model/store_db.dart';
import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_task_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final storeProvider = StateNotifierProvider<StoreNotifier, List<Widget>>((ref) {
  return StoreNotifier();
});

class StoreNotifier extends StateNotifier<List<Widget>> {
  StoreNotifier() : super([]) {
    refresh();
  }

  // definately safer to include int cost in case of cost change on db unreflected in app
  // potental null during id search, etc...
  void purchase(int itemID, int cost) {
    userDB.getUser(currentUserID).currency -= cost;
    refresh();
  }

  void refresh() {
    state = storeDB
        .getShopWidgetsByStoreDatas(userDB.getUnPurcahsedItems(currentUserID));
  }
}
