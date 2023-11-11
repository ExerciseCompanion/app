import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/user_pet.dart';

// Provides access to the Firestore database storing UserPet documents.
class UserPetDatabase {
  UserPetDatabase(this.ref);

  final ProviderRef<UserPetDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<UserPet>> watchUserPets() => _service.watchCollection(
      path: FirestorePath.userPets(),
      builder: (data, documentId) => UserPet.fromJson(data!));

  Stream<UserPet> watchUserPet(int userPetId) => _service.watchDocument(
      path: FirestorePath.userPet(userPetId),
      builder: (data, documentId) => UserPet.fromJson(data!));

  Future<List<UserPet>> fetchUserPets() => _service.fetchCollection(
      path: FirestorePath.userPets(),
      builder: (data, documentId) => UserPet.fromJson(data!));

  Future<UserPet> fetchUserPet(int userPetId) => _service.fetchDocument(
      path: FirestorePath.userPet(userPetId),
      builder: (data, documentId) => UserPet.fromJson(data!));

  Future<void> setUserPet(UserPet userPet) => _service.setData(
      path: FirestorePath.userPet(userPet.id), data: userPet.toJson());
}
