import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

/// Pet Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class Pet with _$Pet {
  const factory Pet({
    required int id,
    required String name,
    required String description,
    required int maxHealth,
    required int maxHunger,
    required int maxExp,
    required String asset,
  }) = _Pet;

  const Pet._();

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Pet>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/initialData/users.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Pet.fromJson(jsonData)).toList();
  }
}
