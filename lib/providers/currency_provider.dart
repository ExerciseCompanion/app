import 'package:exercise_companion/data_model/user_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final currencyProvider = StateNotifierProvider<CurrencyNotifier, int>((ref) {
  int currentUserID = ref.read(currentUserIDProvider);
  final userDB = ref.watch(userDBProvider);

  return CurrencyNotifier(currentUserID, userDB);
});

class CurrencyNotifier extends StateNotifier<int> {
  int currentUserID;
  UserDB userDB;

  CurrencyNotifier(this.currentUserID, this.userDB) : super(0) {
    refresh();
  }

  void addCurrency(int currency) {
    userDB.getUser(currentUserID).currency += currency;
    refresh();
  }

  void refresh() {
    print("Updated currency");
    state = userDB.getUser(currentUserID).currency;
  }
}
