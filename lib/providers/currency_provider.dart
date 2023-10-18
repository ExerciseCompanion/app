import 'package:exercise_companion/data_model/user_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';

/*final selectPetProvider = StateProvider<int>((ref) {
  print("Selected Pet");
  return 0;
});*/

final currencyProvider = StateNotifierProvider<CurrencyNotifier, int>((ref) {
  return CurrencyNotifier();
});

class CurrencyNotifier extends StateNotifier<int> {
  CurrencyNotifier() : super(0) {
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
