// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../domain/user_pets_db.dart';

// final userPetDBProvider = Provider<UserPetDB>((ref) {
//   return UserPetDB(ref);
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_pet.dart';
import 'user_pet_database.dart';

final userPetDatabaseProvider = Provider<UserPetDatabase>((ref) {
  return UserPetDatabase(ref);
});

final userPetsProvider = StreamProvider<List<UserPet>>((ref) {
  final database = ref.watch(userPetDatabaseProvider);
  return database.watchUserPets();
});
