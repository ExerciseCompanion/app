import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pet.dart';

class PetCollection {
  PetCollection(pets) : _pets = pets;
  final List<Pet> _pets;

  Pet getPet(int petID) {
    return _pets.firstWhere((pet) => pet.id == petID);
  }
}

//PetDB petDB = PetDB();

