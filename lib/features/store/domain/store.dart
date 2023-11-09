import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

/// Store Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class Store with _$Store {
  const factory Store({
    required int id,
    required int type, // enum 0: accessory, 1: pet
    required int itemID,
    required int cost,
  }) = _Store;

  const Store._();

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Store>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/initialData/users.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Store.fromJson(jsonData)).toList();
  }
}
