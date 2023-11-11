import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_pet.freezed.dart';
part 'user_pet.g.dart';

/// UserPet Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class UserPet with _$UserPet {
  const factory UserPet({
    required int id,
    required int userID,
    required int petID,
    required int accessoryID,
    required int health,
    required int hunger,
    required int exp,
    required String name,
  }) = _UserPet;

  const UserPet._();

  factory UserPet.fromJson(Map<String, dynamic> json) =>
      _$UserPetFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<UserPet>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/initialData/users.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => UserPet.fromJson(jsonData)).toList();
  }
}
