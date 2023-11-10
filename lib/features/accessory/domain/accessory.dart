import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accessory.freezed.dart';
part 'accessory.g.dart';

/// Accessory Document.
/// You must tell Firestore to use the 'id' field as the documentID
@Freezed()
class Accessory with _$Accessory {
  const factory Accessory({
    required int id,
    required String name,
    required String description,
    required String asset,
  }) = _Accessory;

  const Accessory._();

  factory Accessory.fromJson(Map<String, dynamic> json) =>
      _$AccessoryFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Accessory>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/initialData/Accessorys.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Accessory.fromJson(jsonData)).toList();
  }
}
