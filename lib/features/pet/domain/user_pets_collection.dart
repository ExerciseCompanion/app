import 'package:exercise_companion/features/accessory/domain/accessory_db.dart';
import 'package:exercise_companion/features/pet/data/pet_db_provider.dart';
import 'package:exercise_companion/features/pet/domain/pet_collection.dart';
import 'pet_db.dart';
import '../presentation/pet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../accessory/data/accessory_db_provider.dart';

import 'user_pet.dart';
import 'pet.dart';

class UserPetCollection {
  //UserPetDB(this.ref);
  //final ProviderRef<UserPetDB> ref;

  UserPetCollection(userPets) : _userPets = userPets;
  final List<UserPet> _userPets;

  void addPet(int userID, int petID) {
    int maxID = _userPets
        .reduce((current, next) => current.id > next.id ? current : next)
        .id;
    PetDB petDB = ref.watch(petDBProvider);
    PetCollection pet = petDB.getPet(petID);
    UserPet petData = UserPet(
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

  UserPet getPet(int petID) {
    return _userPets.firstWhere((pet) => pet.id == petID);
  }

  List<UserPet> getPets(int userID) {
    return _userPets.where((pet) => pet.userID == userID).toList();
  }

  List<Widget> getPetWidgets(int userID, int mainPetID) {
    final accessoryDB = ref.read(accessoryDBProvider);

    List<UserPet> pets = getPets(userID);
    List<Widget> widgets = [];

    for (UserPet pet in pets) {
      bool selected =
          mainPetID == pet.id; //(userDB.getUser(userID).mainPetID == pet.id);
      PetDB petDB = ref.watch(petDBProvider);
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

  /*void setMainPetAccessory(int userID, int acessoryID) {
    final userDB = ref.read(userDBProvider);

    int mainPetId = userDB.getUser(userID).mainPetID;
    _userPets.firstWhere((element) => element.id == mainPetId).accessoryID =
        acessoryID;
  }*/
}

//UserPetDB userPetDB = UserPetDB();
