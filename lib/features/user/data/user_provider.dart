import 'package:exercise_companion/repositories/firestore/firestore_providers.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_providers.dart';
import '../domain/user.dart';
import 'user_database.dart';

// final userDBProvider = Provider<UserDatabase>((ref) {
//   return UserDatabase(ref);
// });

// final currentUserIDProvider = StateProvider<int>((ref) {
//   return 0;
// });

final userDatabaseProvider = Provider<UserDatabase>((ref) {
  return UserDatabase(ref);
});

final usersProvider = StreamProvider<List<User>>((ref) {
  final database = ref.watch(userDatabaseProvider);
  return database.watchUsers();
});

final currentUserIDProvider = StateProvider<int>((ref) {
  final FirebaseAuth instance = ref.watch(firebaseAuthProvider);
  //return instance.currentUser!.email!;
  // TODO: match to logged in user
  return 0;
});

final currentUserProvider = FutureProvider<User>((ref) async {
  final int currentUserId = ref.watch(currentUserIDProvider);
  final database = ref.watch(userDatabaseProvider);
  return await database.fetchUser(currentUserId);
});

// final userDatabaseProvider = Provider<UserDatabase>((ref) {
//   return UserDatabase(ref);
// });
//
// final usersProvider = StreamProvider<List<User>>((ref) {
//   final database = ref.watch(userDatabaseProvider);
//   return database.watchUsers();
// });
//
// final currentUserIDProvider = StateProvider<String>((ref) {
//   final FirebaseAuth instance = ref.watch(firebaseAuthProvider);
//   return instance.currentUser!.email!;
// });
//
// final currentUserProvider = FutureProvider<User>((ref) async {
//   final String currentUserId = ref.watch(currentUserIDProvider);
//   final database = ref.watch(userDatabaseProvider);
//   return await database.fetchUser(currentUserId);
// });
