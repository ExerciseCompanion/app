import 'package:exercise_companion/data_model/accessory_db.dart';
import 'package:exercise_companion/data_model/user_db.dart';
import './pet_db.dart';
import '../elements/pet_item.dart';
import 'package:flutter/material.dart';

class UserPetData {
  UserPetData(
      {required this.id,
      required this.userID,
      required this.petID,
      required this.accessoryID,
      required this.name,
      required this.health,
      required this.hunger,
      required this.exp});

  int id;
  int userID;
  int petID;
  int accessoryID;
  int health;
  int hunger;
  int exp;

  String name;
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
        exp: 100,
        name: "Pet A"),
    UserPetData(
        id: 1,
        userID: 0,
        petID: 0,
        accessoryID: 0,
        health: 100,
        hunger: 100,
        exp: 100,
        name: "Pet B"),
    UserPetData(
        id: 2,
        userID: 1,
        petID: 0,
        accessoryID: 0,
        health: 100,
        hunger: 100,
        exp: 100,
        name: "Pet A"),
  ];

  void addPet(int userID, int petID) {
    int maxID = _userPets
        .reduce((current, next) => current.id > next.id ? current : next)
        .id;
    PetData pet = petDB.getPet(petID);
    UserPetData petData = UserPetData(
        id: maxID += 1,
        userID: userID,
        petID: petID,
        accessoryID: 0,
        health: pet.maxHealth,
        hunger: pet.maxHunger,
        exp: pet.maxExp,
        name: "Pet");
    _userPets.add(petData);
    //TODO: cjange hp to pet's deafult
  }

  UserPetData getPet(int petID) {
    return _userPets.firstWhere((pet) => pet.id == petID);
  }

  List<UserPetData> getPets(int userID) {
    return _userPets.where((pet) => pet.userID == userID).toList();
  }

  List<Widget> getPetWidgets(int userID) {
    List<UserPetData> pets = getPets(userID);
    List<Widget> widgets = [];

    for (UserPetData pet in pets) {
      bool selected = (userDB.getUser(userID).mainPetID == pet.id);
      PetData petData = petDB.getPet(pet.petID);
      AccessoryData accessoryData = accessoryDB.getAccessory(pet.accessoryID);
      widgets.add(PetViewWidget(
          petAsset: petData.asset,
          accessoryAsset: accessoryData.asset,
          name: pet.name,
          healthRatio: pet.health / petData.maxHealth,
          expRatio: pet.exp / petData.maxExp,
          selected: selected,
          userPetId: pet.id));
      //widgets.add(const Divider());
    }

    return widgets;
  }

  void setMainPetAccessory(int userID, int acessoryID) {
    int mainPetId = userDB.getUser(userID).mainPetID;
    _userPets.firstWhere((element) => element.id == mainPetId).accessoryID =
        acessoryID;
  }
}

UserPetDB userPetDB = UserPetDB();
