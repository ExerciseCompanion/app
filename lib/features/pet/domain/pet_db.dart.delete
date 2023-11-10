import 'package:flutter_riverpod/flutter_riverpod.dart';

class PetData {
  PetData(
      {required this.id,
      required this.name,
      required this.description,
      required this.maxHealth,
      required this.maxHunger,
      required this.maxExp,
      required this.asset});

  int id;
  String name;
  String description;
  int maxHealth;
  int maxHunger;
  int maxExp;
  String asset;
}

class PetDB {
  final List<PetData> _pets = [
    PetData(
        id: 0,
        name: "Test Pet",
        description: "A Friendly Companion",
        maxHealth: 100,
        maxHunger: 100,
        maxExp: 100,
        asset: "images/pet_test.png"),
    PetData(
        id: 1,
        name: "Test Pet 2",
        description: "A Friendly Companion",
        maxHealth: 100,
        maxHunger: 100,
        maxExp: 100,
        asset: "images/pet_test.png"),
  ];

  PetData getPet(int petID) {
    return _pets.firstWhere((pet) => pet.id == petID);
  }
}

//PetDB petDB = PetDB();

