import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_db.dart';

final userDBProvider = Provider<UserDatabase>((ref) {
  return UserDatabase(ref);
});

final currentUserIDProvider = StateProvider<int>((ref) {
  return 0;
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
