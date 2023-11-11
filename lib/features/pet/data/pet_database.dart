import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/pet.dart';

// Provides access to the Firestore database storing Pet documents.
class PetDatabase {
  PetDatabase(this.ref);

  final ProviderRef<PetDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Pet>> watchPets() => _service.watchCollection(
      path: FirestorePath.pets(),
      builder: (data, documentId) => Pet.fromJson(data!));

  Stream<Pet> watchPet(int petId) => _service.watchDocument(
      path: FirestorePath.pet(petId),
      builder: (data, documentId) => Pet.fromJson(data!));

  Future<List<Pet>> fetchPets() => _service.fetchCollection(
      path: FirestorePath.pets(),
      builder: (data, documentId) => Pet.fromJson(data!));

  Future<Pet> fetchPet(int petId) => _service.fetchDocument(
      path: FirestorePath.pet(petId),
      builder: (data, documentId) => Pet.fromJson(data!));

  Future<void> setPet(Pet pet) =>
      _service.setData(path: FirestorePath.pet(pet.id), data: pet.toJson());
}
