// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../domain/pet_db.dart';

// final petDBProvider = Provider<PetDB>((ref) {
//   return PetDB();
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/pet.dart';
import 'pet_database.dart';

final petDatabaseProvider = Provider<PetDatabase>((ref) {
  return PetDatabase(ref);
});

final petsProvider = StreamProvider<List<Pet>>((ref) {
  final database = ref.watch(petDatabaseProvider);
  return database.watchPets();
});
