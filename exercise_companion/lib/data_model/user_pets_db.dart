import 'package:exercise_companion/data_model/user_db.dart';
import './pet_db.dart';

class UserPetData {
  UserPetData(
      {required this.id,
      required this.userID,
      required this.petID,
      this.accessoryID,
      required this.health,
      required this.hunger,
      required this.exp});

  int id;
  int userID;
  int petID;
  int? accessoryID;
  int health;
  int hunger;
  int exp;
}

class UserPetDB {
  final List<UserPetData> _userPets = [
    UserPetData(
        id: 0,
        userID: 0,
        petID: 0,
        accessoryID: 0,
        health: 100,
        hunger: 100,
        exp: 100),
  ];

  UserPetData getPet(int petID) {
    return _userPets.firstWhere((pet) => pet.id == petID);
  }
}

UserPetDB userPetDB = UserPetDB();
